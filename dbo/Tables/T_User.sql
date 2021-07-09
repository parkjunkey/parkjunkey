CREATE TABLE [dbo].[T_User] (
    [RegDT]                 DATETIME       CONSTRAINT [DF_User_RegDT] DEFAULT (getdate()) NOT NULL,
    [DelDT]                 DATETIME       NULL,
    [UserIdx]               INT            IDENTITY (1, 1) NOT NULL,
    [Email]                 NVARCHAR (256) NULL,
    [Pwd]                   NVARCHAR (256) NULL,
    [PwdFailCnt]            INT            NULL,
    [NickName]              NVARCHAR (50)  NOT NULL,
    [Point]                 INT            CONSTRAINT [DF_User_Point] DEFAULT ((0)) NOT NULL,
    [PointBonus]            INT            CONSTRAINT [DF_User_PointBonus] DEFAULT ((0)) NOT NULL,
    [Phone]                 NVARCHAR (256) NULL,
    [UserType]              INT            CONSTRAINT [DF_User_UserType] DEFAULT ((1)) NOT NULL,
    [Certify]               BIT            CONSTRAINT [DF_User_Certify] DEFAULT ((1)) NOT NULL,
    [CertifyPhone]          BIT            NULL,
    [CertifyEmail]          BIT            NULL,
    [DelCategory]           INT            NULL,
    [DelReason]             NVARCHAR (250) NULL,
    [ModDT]                 DATETIME       NULL,
    [AnalystRegDT]          DATETIME       NULL,
    [AccessType]            INT            NULL,
    [SvcType]               NVARCHAR (30)  CONSTRAINT [DF_User_Svc] DEFAULT ('StockPoint') NOT NULL,
    [SNSNaverRegDT]         DATETIME       NULL,
    [SNSNaverKey]           NVARCHAR (200) NULL,
    [SNSGoogleRegDT]        DATETIME       NULL,
    [SNSGoogleKey]          NVARCHAR (200) NULL,
    [SNSFacebookRegDT]      DATETIME       NULL,
    [SNSFacebookKey]        NVARCHAR (200) NULL,
    [AgreeMarketing]        BIT            CONSTRAINT [DF_User_AgreeMarketing] DEFAULT ((0)) NULL,
    [FakeUser]              BIT            CONSTRAINT [DF_User_FakeUser] DEFAULT ((0)) NOT NULL,
    [MKIdx]                 INT            NULL,
    [RecommendUserIdx]      INT            NULL,
    [SMS]                   BIT            CONSTRAINT [DF_User_SMS] DEFAULT ((1)) NOT NULL,
    [SMSStockPoint]         BIT            CONSTRAINT [DF_User_SMSStockPoint] DEFAULT ((1)) NULL,
    [SMSThemeRadar]         BIT            CONSTRAINT [DF_User_SMSThemeRadar] DEFAULT ((1)) NULL,
    [SMSStarter]            BIT            CONSTRAINT [DF_User_SMSStarter] DEFAULT ((1)) NULL,
    [APP]                   INT            CONSTRAINT [DF_User_APP] DEFAULT ((0)) NULL,
    [AppKey]                VARCHAR (200)  NULL,
    [OSType]                INT            CONSTRAINT [DF_User_OSType] DEFAULT ((1)) NOT NULL,
    [OSVer]                 VARCHAR (100)  NULL,
    [DeviceModel]           VARCHAR (100)  NULL,
    [DeviceID]              VARCHAR (100)  NULL,
    [AppToken]              VARCHAR (50)   NULL,
    [StockMarketAlarm]      BIT            CONSTRAINT [DF_User_StockMarketAlarm] DEFAULT ((0)) NOT NULL,
    [Gender]                INT            NULL,
    [BirthDT]               DATETIME       NULL,
    [PostCode]              NVARCHAR (256) NULL,
    [Address]               NVARCHAR (256) NULL,
    [AddressDetail]         NVARCHAR (256) NULL,
    [Interest]              NVARCHAR (200) NULL,
    [DeviceCount]           INT            CONSTRAINT [DF_User_DeviceCount] DEFAULT ((1)) NULL,
    [LoginDT]               DATETIME       CONSTRAINT [DF_User_LoginDT] DEFAULT (getdate()) NULL,
    [PasswordChangeDT]      DATETIME       CONSTRAINT [DF_User_PasswordChangeDT] DEFAULT (getdate()) NULL,
    [IsInactive]            BIT            CONSTRAINT [DF_User_IsInactive] DEFAULT ((0)) NULL,
    [SNSAppleRegDT]         DATETIME       NULL,
    [SNSAppleKey]           NVARCHAR (200) NULL,
    [JoinUserIdx]           INT            NULL,
    [JoinType]              INT            CONSTRAINT [DF_User_JoinType] DEFAULT ((10)) NOT NULL,
    [Adult]                 BIT            CONSTRAINT [DF_User_Adult] DEFAULT ((0)) NULL,
    [SMSFunding]            BIT            CONSTRAINT [DF_User_SMSFunding] DEFAULT ((1)) NULL,
    [AgreeMarketingDT]      DATETIME       NULL,
    [AgreeMarketingAlarmDT] DATETIME       NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'회원', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'등록 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'RegDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'삭제 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'DelDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'사용자 키값  #Ref - T_User.UserIdx', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'UserIdx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'이메일', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Email';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'비밀번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Pwd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'비밀번호 오류 횟수', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'PwdFailCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'닉네임', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'NickName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'포인트', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Point';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'포인트보너스', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'PointBonus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'연락처', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Phone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'사용자 타입 #Ref - T_Code.Code(UserType)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'UserType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'인증유무 [ 1 - 인증 | 1 - 비인증 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Certify';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'휴대폰 인증유무 [ 1 - 인증 | 1 - 비인증 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'CertifyPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'이메일 인증유무 [ 1 - 인증 | 1 - 비인증 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'CertifyEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'탈퇴사유 카테고리 [ 1-서비스 질이 낮음 | 2-이용빈도 낮음 ... ] #Ref - T_Code.Code(DelCategory)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'DelCategory';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'삭제 사유', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'DelReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'수정 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'ModDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'멘토 등록 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AnalystRegDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'접속 디바이스 타입 [ 1-WEB | 2-APP | 3-MOBILE  #Ref - T_Code.Code(AccessType)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AccessType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'서비스(사이트) 타입 #Ref - T_Code.Code(SvcType)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SvcType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_네이버_등록 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSNaverRegDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_네이버_고유번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSNaverKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_구글_등록 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSGoogleRegDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_구글_고유번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSGoogleKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_페이스북_등록 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSFacebookRegDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_페이스북_고유번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSFacebookKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'마케팅 수신동의', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AgreeMarketing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'가짜 유저 [ 1 - 가짜유저 | 0 - 일반유저 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'FakeUser';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'마케팅 키값 #Ref - T_Marketing.MKIdx', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'MKIdx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'추천인 키', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'RecommendUserIdx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SMS 수신여부 [ 0 - 수신안함 | 1 - 수신 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SMS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SMS 수신 (스탁포인트)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SMSStockPoint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SMS 수신 (테마레이더)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SMSThemeRadar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SMS 수신 (핀업스타터)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SMSStarter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'APP 수신여부 [ 0 - 수신안함 | 1 - 수신 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'APP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'푸시 발송을 위한 앱키값', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AppKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'OS [ 1 - Android | 2 - IOS ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'OSType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'OS 버전', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'OSVer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'디바이스 모델', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'DeviceModel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'디바이스 ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'DeviceID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'앱 자동 로그인 토큰', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AppToken';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'증시일정 수신 여부 [ 0-미수신 | 1-수신 ]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'StockMarketAlarm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'성별 [ 1:남자 | 2:여자 ] #Ref - T_Code.Code(Gender)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Gender';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'생년월일', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'BirthDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'우편번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'PostCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'주소', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'상세주소', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AddressDetail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'관심사', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Interest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'기기 제한 갯수', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'DeviceCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'로그인 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'LoginDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'비밀번호 변경 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'PasswordChangeDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'계정 휴면 여부', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'IsInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_애플_등록 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSAppleRegDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SNS로그인_애플_고유번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SNSAppleKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'비회원에서 회원으로 가입한 번호', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'JoinUserIdx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'회원 타입 [ 10 - FinUp 회원 | 20 - DB 수집 TOP3 알리미 | 30 - LG 부가서비스 ] #Ref - T_UserJoinType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'JoinType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'성인인증 여부', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'Adult';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SMS 수신 (핀업 펀딩)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'SMSFunding';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'마케팅 수신 동의 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AgreeMarketingDT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'마케팅 수신 동의 안내 발송 일시', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'T_User', @level2type = N'COLUMN', @level2name = N'AgreeMarketingAlarmDT';

