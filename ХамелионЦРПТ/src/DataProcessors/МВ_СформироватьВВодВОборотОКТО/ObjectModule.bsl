Функция ЗагрузитьФайлыОКТОНаСервере( КаталогЗагрузки = Неопределено, РегламентноеЗадание) Экспорт
	Сообщение = Новый СообщениеПользователю;
	МассивНастроек = Новый Массив;
	ПереченьНастроек = ПланыВидовХарактеристик.МВ_ПереченьДополнительныхНастроек;
	МассивНастроек.Добавить(ПереченьНастроек.ОКТОКаталогФайловДляВводаВОборот);
	МассивНастроек.Добавить(ПереченьНастроек.ОКТОЛогин);
	МассивНастроек.Добавить(ПереченьНастроек.ОКТОПароль);
	СоответствиеНастроек = РегистрыСведений.МВ_ДополнительныеНастройки.ПолучитьЗначения(МассивНастроек,ТекущаяДатаСеанса());
	Интерактивно = Ложь;
	ПутьЗагрузки = СоответствиеНастроек.Получить(МассивНастроек[0]);
	Если ПутьЗагрузки = Неопределено Тогда		
		Текст = НСтр("ru = 'Не смогли определить путь выгрузки.'");
		Если Интерактивно Тогда			
			Сообщение.Текст = Текст;
			Сообщение.Сообщить();
		Иначе		
			ЗаписьЖурналаРегистрации(НСтр("ru = '(МВ).Интеграция с ОКТО. Загрузка Ввод в оборот по рассписанию.'", ОбщегоНазначения.КодОсновногоЯзыка()), УровеньЖурналаРегистрации.Информация, Метаданные.Обработки.МВ_ИнтеграцияСФилиальнойБазойРозница.Имя,, НСтр("ru = 'Не смогли определить путь выгрузки.'"));
		КонецЕсли;
		Возврат Текст;
	КонецЕсли;
	
	Логин = СоответствиеНастроек.Получить(МассивНастроек[1]);
	Пароль = СоответствиеНастроек.Получить(МассивНастроек[2]);
	ФайловаяСистема.ЗапуститьПрограмму("net use " + ПутьЗагрузки + " /USER:" + Логин + " " + Пароль);

	 ДатаЗагрузки = ТекущаяДатаСеанса();
	ИмяФайла = Новый Файл(ПутьЗагрузки + Формат(ДатаЗагрузки, "Л=; ДФ=yyyyMMdd") + ".DBF");
	
	Если Не ИмяФайла.Существует() Тогда
		Текст = НСтр("ru = 'Не смогли определить путь выгрузки.'");
		Возврат  Текст;
	КонецЕсли;	
	//ЗавершениеОбратныйВызов = Новый ОписаниеОповещения("ЗавершениеОбратныйВызов", ЭтотОбъект);
	//ПрогрессОбратныйВызов = Новый ОписаниеОповещения("ПрогрессОбратныйВызов", ЭтотОбъект);
	//ПередНачаломОбратныйВызов = Новый ОписаниеОповещения("ПередНачаломОбратныйВызов", ЭтотОбъект);
    //НачатьПомещениеФайлаНаСервер(ЗавершениеОбратныйВызов, ПрогрессОбратныйВызов, ПередНачаломОбратныйВызов,,КаталогЗагрузки, ЭтаФорма.УникальныйИдентификатор);
	
	
КонецФункции	
