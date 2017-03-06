DECLARE @dtStart DATE;
DECLARE @dtEnd  DATE;
DECLARE @nCount INT;
DECLARE @nWeek INT;
DECLARE @strName NVARCHAR(127);
set @dtStart = '2017-01-01';
set @dtEnd = '2017-01-07';
set @nCount = 1;

delete from KanBan_Cycle_Period;
WHILE @dtStart < '2018-01-01'
BEGIN
  set @nWeek = 1;
  WHILE @nWeek < 52
  BEGIN
	  set @strName = ('C' + convert(nvarchar(4),@nCount) + '.' + convert(nvarchar(4),@nWeek));
	  insert into dbo.KanBan_Cycle_Period ( Cycle_ID, KanBan_ID, Name, StartDate, EndDate ) values(1,1,@strName, @dtStart, @dtEnd  );
	  set @nWeek = @nWeek + 1;
	  set @dtStart = DATEADD(day,7,@dtStart);
	  set @dtEnd = DATEADD(day,7,@dtEnd);
  END
  set @nCount = @nCount + 1;
END