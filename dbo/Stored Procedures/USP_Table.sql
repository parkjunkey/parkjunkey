/*
=============================================
Desc.	:	테이블 정보보기
Example	:
History	:	
=============================================
*/
CREATE PROCEDURE [dbo].[USP_Table]
	@objectName		NVARCHAR(128)		--# 테이블명
AS
BEGIN

	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT		A.Table_Name
				, A.Comments
				, B.Column_Name
				, 'Type'			= UPPER(B.Type)
				, 'Nullable'		= CASE B.Nullable	WHEN 'NO'	THEN ''
														WHEN 'YES'	THEN 'Y'
																	ELSE ''
									END
				, '[Default]'		= CASE	WHEN B.[Default] IS NULL	THEN ''
																		ELSE B.[Default]
									END
				, '[IndexType]'		= CASE	WHEN C.IndexType IS NULL	THEN ''
																		ELSE C.IndexType
									END
				, B.COMMENTS
				, 'T_Code 조회 쿼리'	= CASE	WHEN CHARINDEX('T_Code.', B.COMMENTS) = 0
													THEN ''
													ELSE 'SELECT * FROM FinUp.dbo.T_Code WITH (NOLOCK) WHERE CodeType = '''
															+ SUBSTRING(
																SUBSTRING(B.COMMENTS, CHARINDEX('T_Code.', B.COMMENTS)+7, LEN(B.COMMENTS))
																, CHARINDEX('(', SUBSTRING(B.COMMENTS, CHARINDEX('T_Code.', B.COMMENTS)+7, LEN(B.COMMENTS)))+1
																, CHARINDEX(')', SUBSTRING(B.COMMENTS, CHARINDEX('T_Code.', B.COMMENTS)+7, LEN(B.COMMENTS)))
																	- CHARINDEX('(', SUBSTRING(B.COMMENTS, CHARINDEX('T_Code.', B.COMMENTS)+7, LEN(B.COMMENTS)))-1
															)
															+ ''' ORDER BY Code'
									END
	FROM
	(
				SELECT		'NUM'			= 1
							, 'Table_Name'	= U.Name + '.' + T.Name
							, 'COMMENTS'	= TD.Value
				FROM        sysobjects AS T
				JOIN		sysusers AS U
					ON      U.Uid = T.Uid
				LEFT JOIN	sys.extended_properties AS TD
					ON      td.major_id = t.id
					AND     td.minor_id = 0
					AND     td.name = 'MS_Description'
				WHERE		T.Type = 'U'
				AND			T.Name = @objectName
	) AS A
	JOIN
	(
				SELECT		'NUM'					= 1
							, A.[Table_Name]
							, A.[COLUMN_NAME]
							, A.[TYPE]
							--,A.[CHARSET]
							--,A.[COLLATION]
							, A.[NULLABLE]
							, A.[DEFAULT]
							, B.[COMMENTS]
							, A.[ORDINAL_POSITION]
				FROM
				(
							SELECT		TABLE_NAME
										, COLUMN_NAME
										, 'TYPE'			= CASE DATA_TYPE	WHEN 'char'			THEN DATA_TYPE + '(' + CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
																				WHEN 'numeric'		THEN DATA_TYPE + '(' + CAST(NUMERIC_PRECISION AS VARCHAR) + ', ' + CAST(NUMERIC_SCALE AS VARCHAR) + ')'
																				WHEN 'nvarchar'		THEN DATA_TYPE + '(' + CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
																				WHEN 'varbinary'	THEN DATA_TYPE + '(' + CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
																				WHEN 'varchar'		THEN DATA_TYPE + '(' + CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
																									ELSE DATA_TYPE
															END
															+
															CASE WHEN B.is_identity = 1 THEN ' (IDENTITY)'
																						ELSE ''
															END
										, 'CHARSET'			= CHARACTER_SET_NAME
										, 'COLLATION'		= COLLATION_NAME
										, 'NULLABLE'		= IS_NULLABLE
										, 'DEFAULT'			= COLUMN_DEFAULT
										, ORDINAL_POSITION
							FROM		INFORMATION_SCHEMA.COLUMNS AS A
							LEFT JOIN
							(
										SELECT		'TableName'		= TBL.name
													, 'ColumnName'	= AC.name
													, is_identity
										FROM		sys.tables AS TBL
										JOIN		sys.all_columns AS AC
											ON		AC.object_id = TBL.object_id
										WHERE		TBL.name = @objectName
							) AS B
								ON		A.TABLE_NAME = B.TableName
								AND		A.COLUMN_NAME = B.ColumnName
							WHERE		TABLE_NAME = @objectName
				) AS A
				FULL JOIN
				(
							SELECT		'COMMENTS'	= CAST(value AS NVARCHAR(1000))
										, 'NAME'	= CAST(objname AS NVARCHAR(128))
							FROM		::fn_listextendedproperty ('MS_Description', 'user', 'dbo', 'table', @objectName, 'column', default)
				) AS B
					ON		A.COLUMN_NAME COLLATE Korean_Wansung_CI_AS = B.NAME COLLATE Korean_Wansung_CI_AS
	) AS B
		ON		A.NUM = B.NUM
	LEFT JOIN
	(
				SELECT		'Table_Name'	= TBL.name
							, 'Column_Name'	= AC.name
							, 'IndexType'	= SUBSTRING(TIDX.Name, 1, CHARINDEX('_', TIDX.Name)-1)
				FROM		sys.tables AS TBL
				JOIN		sys.all_columns AS AC
					ON		AC.object_id = TBL.object_id
				LEFT JOIN	sys.index_columns AS IC
					ON		IC.column_id = AC.column_id
					AND		IC.object_id = TBL.object_id
				LEFT JOIN	sys.indexes AS TIDX
					ON		TIDX.object_id = AC.object_id
					AND		TIDX.Index_id = IC.Index_Id
				WHERE		SUBSTRING(TIDX.Name, 1, CHARINDEX('_', TIDX.Name)-1) IS NOT NULL
				AND			TBL.Name = @objectName
	) AS C
		ON		B.Table_Name = C.Table_Name
		AND		B.Column_Name = C.Column_Name
	ORDER BY	B.ORDINAL_POSITION

END