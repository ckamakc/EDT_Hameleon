
&НаКлиенте
Процедура ОткрытьВнешниеОбработки(Команда)
	// Вставить содержимое обработчика.
	// Вставить содержимое обработчика.
	ОткрытьФорму("Справочник.ВнешниеОбработки_ХамелеонЦРПТ.Форма.ФормаСписка",
	Новый структура("Тип",
		ТипДокумента()));
КонецПроцедуры


Функция ТипДокумента()
	Возврат Метаданные.НайтиПоТипу(ТипЗнч(Документы.GS1_Обувь_ХамелеонЦРПТ.ПустаяСсылка())).ПолноеИмя()
КонецФункции

