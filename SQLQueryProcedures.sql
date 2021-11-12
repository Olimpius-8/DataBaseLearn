use Pelegram
go
create procedure Statistic
@idword int, 
@idmajor int
As
begin 
declare @sumcoinc int
declare @sum int
	select @sumcoinc = sum(CountInMessage) from Coincedence 
	where IDWord = @idword AND IDMajor = @idmajor
	
	select @sum = count(Mentions.TimeWithStartRing) from Mentions
	where IDWord = @idword AND IDMajor = @idmajor
	
	select @sum = @sum + @sumcoinc
	return @sum
end 
go

select coincedence.IDword, StopWords.Word, ComradeMajor.ID, 'FIO' = name+lastname+surname, 'Количество совпадений' = dbo.Statistic(IDword, IDMajor) 
from Coincedence 
JOIN Dictionary on Dictionary.IDWord = Coincedence.IDWord
JOIN ComradeMajor on Coincedence.IDMajor = ComradeMajor.ID
JOIN StopWords on StopWords.ID = Dictionary.IDWord
GROUP BY Coincedence.IDWord,StopWords.Word,ComradeMajor.ID,name,lastname, surname
