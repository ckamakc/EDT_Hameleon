
Процедура ПередЗаписью(Отказ)
	// Вставить содержимое обработчика.
	Если не значениеЗаполнено(Сайт) Тогда
		Сайт=Перечисления.Сайты_ХамелеонЦРПТ.Обувь;
	КонецЕсли;
	Если Не ЗначениеЗаполнено(Наименование) Тогда
		Наименование=ЭтотОбъект.КонтактноеЛицо;
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ШаблонКМПоУмолчанию) Тогда
		ШаблонКМПоУмолчанию=Перечисления.Шаблоны_подписи_кодов_КМ_ХамелеонЦРПТ._44_Фармацевтика;
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ШаблонКМТабакПоУмолчанию) Тогда
		ШаблонКМТабакПоУмолчанию=Перечисления.Шаблоны_подписи_кодов_КМ_Табак_ХамелеонЦРПТ.Пачка;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(СтранаПоУмолчанию) Тогда
		//СтранаПоУмолчанию=Справочники.СтранаПроизводства_ХамелеонЦРПТ.НайтиПоКоду(643);
	Конецесли;
	
	Если СайтыВходаВСистему.Наименование="Молоко" Тогда
		ТипОплаты=Перечисления.ТипОплаты_ХамелеонЦРПТ.ОплатаПоНанесению;
	Конецесли;
	
КонецПроцедуры

Процедура ПриЗаписи(Отказ)
	
	// Вставить содержимое обработчика.
	Обработки._Запуск_ХамелеонЦРПТ.ОбновитьСправочникиТНВЭД(ЭтотОбъект.СайтыВходаВСистему.Наименование);
	
КонецПроцедуры
