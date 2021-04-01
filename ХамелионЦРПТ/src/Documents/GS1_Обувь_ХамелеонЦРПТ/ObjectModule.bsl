
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	Если Шины.Количество()>0 Тогда
		Если Не ЗначениеЗаполнено(ЭтотОбъект.Статус) Тогда
			ЭтотОбъект.Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан;
			Для Каждого Стр Из   Шины Цикл
				Если Стр.РезультатОбработкиДанныхВGS46<>"OK" Тогда
					ЭтотОБъект.Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ФайлОбработанЧастично;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
		
		Для Каждого Стр_1 Из ЭтотОбъект.Шины Цикл
			Если Найти(Стр_1.РезультатОбработкиДанныхВGS46,"Кодирование невозможно, так как нет больше свободных номеров в префиксах предприятия.")>0 Тогда
				Ошибка="Кодирование невозможно, так как нет больше свободных номеров в префиксах предприятия.";
			КонецЕсли;
		КонецЦикла;		
	Иначе
		Если Не ЗначениеЗаполнено(ЭтотОбъект.Статус) Тогда
			ЭтотОбъект.Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан;
			Для Каждого Стр Из   GS1 Цикл
				Если Стр.РезультатОбработкиДанныхВGS46<>"OK" Тогда
					ЭтотОБъект.Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ФайлОбработанЧастично;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
		
		Для Каждого Стр_1 Из ЭтотОбъект.GS1 Цикл
			Если Найти(Стр_1.РезультатОбработкиДанныхВGS46,"Кодирование невозможно, так как нет больше свободных номеров в префиксах предприятия.")>0 Тогда
				Ошибка="Кодирование невозможно, так как нет больше свободных номеров в префиксах предприятия.";
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	Если РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().АвтоматическиОбрабатыватьОшибкуТакаяУпаковкаУжеЕсть Тогда
	// Вставить содержимое обработчика.
	Если Шины.Количество()>0 Тогда
		Для Каждого Стр_1 Из ЭтотОбъект.Шины Цикл
			Если Найти(Стр_1.РезультатОбработкиДанныхВGS46,"Такая упаковка уже есть")>0 Тогда
				
				GTIN=Сред(Стр_1.РезультатОбработкиДанныхВGS46,26);
				GTIN=СокрЛП(Сред(GTIN,Найти(GTIN," ")));
				GTIN=Сред(GTIN,1,Найти(GTIN," ")-1);
				
				Если СтрДлина(GTIN)<13 Тогда
					
					GTIN=Сред(Стр_1.РезультатОбработкиДанныхВGS46,39);
					GTIN=СокрЛП(Сред(GTIN,Найти(GTIN," ")+1));
					GTIN=Сред(GTIN,Найти(GTIN," ")+1);
					GTIN=Сред(GTIN,1,Найти(GTIN," ")-1);
					
					
				Конецесли;
				
				
				Попытка
					GTIN=Число(GTIN);
					Если Не ЗначениеЗаполнено(GTIN) Тогда
						Продолжить;
					КонецЕсли;
						
					СпрОб=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("GTIN",Число(GTIN));
					Если Спроб=Справочники.Продукция_ХамелеонЦРПТ.ПустаяСсылка() Тогда
						Спроб=Справочники.Продукция_ХамелеонЦРПТ.СоздатьЭлемент();
						
					Иначе
						СпрОб=СпрОб.ПолучитьОбъект();
					КонецЕсли;
					СпрОб.Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Обувь;
					
					ЗаполнитьЗначенияСвойств(СпрОб,Стр_1);
					Если Не ЗначениеЗаполнено(СпрОб.КодВУчетнойСистеме) Тогда
						СпрОб.КодВУчетнойСистеме=Стр_1.КодВУчетнойСистеме
					КонецЕсли;
					СпрОб.GTIN=GTIN;
					СпрОб.Наименование=Стр_1.НаименованиеТовараНаЭтикетке;
					СпрОб.НаименованиеТовара=Стр_1.НаименованиеТовараНаЭтикетке;
					
					//СпрОб.Размер=Стр_1.РазмерВШтихмассовойСистеме;
					
					
					СпрОб.Записать();
					Стр_1.GTIN=GTIN;
					Стр_1.Товар=СпрОб.Ссылка;
					
				Исключение
					Продолжить;
				КонецПопытки;
			КонецЕсли;
			
		Конеццикла;
		
	Иначе
		Для Каждого Стр_1 Из ЭтотОбъект.GS1 Цикл
			Если Найти(Стр_1.РезультатОбработкиДанныхВGS46,"Такая упаковка уже есть")>0 Тогда
				
				GTIN=Сред(Стр_1.РезультатОбработкиДанныхВGS46,39);
				GTIN=СокрЛП(Сред(GTIN,Найти(GTIN," ")));
				GTIN=Сред(GTIN,1,Найти(GTIN," ")-1);
				
				Если СтрДлина(GTIN)<13 Тогда
					
					GTIN=Сред(Стр_1.РезультатОбработкиДанныхВGS46,39);
					GTIN=СокрЛП(Сред(GTIN,Найти(GTIN," ")+1));
					GTIN=Сред(GTIN,Найти(GTIN," ")+1);
					GTIN=Сред(GTIN,1,Найти(GTIN," ")-1);
					
					
				Конецесли;
				
				Попытка
					GTIN=Число(GTIN);
					Если Не ЗначениеЗаполнено(GTIN) Тогда
						Продолжить;
					КонецЕсли;
						
					СпрОб=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("GTIN",Число(GTIN));
					Если Спроб=Справочники.Продукция_ХамелеонЦРПТ.ПустаяСсылка() Тогда
						Спроб=Справочники.Продукция_ХамелеонЦРПТ.СоздатьЭлемент();
						
					Иначе
						СпрОб=СпрОб.ПолучитьОбъект();
					КонецЕсли;
					СпрОб.Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Обувь;
					
					ЗаполнитьЗначенияСвойств(СпрОб,Стр_1);
					Если Не ЗначениеЗаполнено(СпрОб.КодВУчетнойСистеме) Тогда
						СпрОб.КодВУчетнойСистеме=Стр_1.КодВУчетнойСистеме
					КонецЕсли;
					СпрОб.GTIN=GTIN;
					СпрОб.Наименование=Стр_1.НаименованиеТовараНаЭтикетке;
					СпрОб.НаименованиеТовара=Стр_1.НаименованиеТовараНаЭтикетке;
					
					СпрОб.Размер=Стр_1.РазмерВШтихмассовойСистеме;
					
					
					СпрОб.Записать();
					Стр_1.GTIN=GTIN;
					Стр_1.Товар=СпрОб.Ссылка;
					
				Исключение
					Продолжить;
				КонецПопытки;
			КонецЕсли;
			
		Конеццикла;
	КонецЕсли;	
		
КонецЕсли;
Если Шины.Количество()>0 Тогда
		Для Каждого Стр_1 Из Шины Цикл
			Если Не ЗначениеЗаполнено(Стр_1.Товар.КодВУчетнойСистеме) 
				И ЗначениеЗАполнено(Стр_1.Товар) 
				И ЗначениеЗаполнено(Стр_1.КодВУчетнойСистеме) Тогда
				СпрОб=Стр_1.Товар.ПолучитьОбъект();
							СпрОб.КодВУчетнойСистеме=Стр_1.КодВУчетнойСистеме;
							СпрОб.Записать();
						КонецЕсли;
					Конеццикла;
Иначе
		Для Каждого Стр_1 Из GS1 Цикл
			Если Не ЗначениеЗаполнено(Стр_1.Товар.КодВУчетнойСистеме) 
				И ЗначениеЗАполнено(Стр_1.Товар) 
				И ЗначениеЗаполнено(Стр_1.КодВУчетнойСистеме) Тогда
				СпрОб=Стр_1.Товар.ПолучитьОбъект();
							СпрОб.КодВУчетнойСистеме=Стр_1.КодВУчетнойСистеме;
							СпрОб.Записать();
						КонецЕсли;
					Конеццикла;
КонецЕсли;	
КонецПроцедуры

Процедура ПриКопировании(ОбъектКопирования)
	// Вставить содержимое обработчика.
	
	Для Каждого Стр Из GS1 Цикл
		Стр.РезультатОбработкиДанныхВGS46=Неопределено;
	КонецЦикла;
	ЭтоТОбъект.ИмяФайла="";
	ЭтоТОбъект.НазваниеДокумента="";
	
	Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ПодготовленКОтправке;
	ЭтотОбъект.РезультатОбработкиДанныхВGS46="";
	ЭтотОБъект.НазваниеДокумента=Неопределено;
	новыйФормат=Ложь;
КонецПроцедуры
