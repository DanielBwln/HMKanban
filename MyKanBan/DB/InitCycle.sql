DECLARE @dtStart DATE;
DECLARE @dtEnd  DATE;
DECLARE @nCount INT;
DECLARE @nWeek INT;
DECLARE @strName NVARCHAR(127);
set @dtStart = '2011-07-11';
set @dtEnd = '2011-07-17';
set @nCount = 1;

delete from KanBan_Cycle_Period;
WHILE @dtStart < '2014-01-01'
BEGIN
  set @nWeek = 1;
  WHILE @nWeek < 2000
  BEGIN
	  set @strName = ('C' + convert(nvarchar(4),@nCount) + '.' + convert(nvarchar(4),@nWeek));
	  insert into dbo.KanBan_Cycle_Period ( Cycle_ID, KanBan_ID, Name, StartDate, EndDate ) values(1,1,@strName, @dtStart, @dtEnd  );
	  set @nWeek = @nWeek + 1;
	  set @dtStart = DATEADD(day,7,@dtStart);
	  set @dtEnd = DATEADD(day,7,@dtEnd);
  END
  set @nCount = @nCount + 1;
END