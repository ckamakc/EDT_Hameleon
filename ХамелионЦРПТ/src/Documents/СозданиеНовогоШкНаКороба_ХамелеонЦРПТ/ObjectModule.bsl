
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
       Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Записывать=Истина;
            Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Очистить();
			
			
		Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Записывать=Истина;
	    Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Очистить();
		
		
		Движения.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Записывать=Истина;
	    Движения.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Очистить();
		
	Если Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан Тогда
		
		Если ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.Расформирование Тогда
			
			Если ЭтотОбъект.МаркиОприходовать.Количество()=0 Тогда
				Для Каждого Стр_1 Из Марки цикл
					//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
					// Данный фрагмент построен конструктором.
					// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
					
					Запрос = Новый Запрос;
					Запрос.Текст = 
						"ВЫБРАТЬ
						|	УникальныеУпаковки_ХамелеонЦРПТ.УИТ
						|ИЗ
						|	РегистрСведений.УникальныеУпаковки_ХамелеонЦРПТ КАК УникальныеУпаковки_ХамелеонЦРПТ
						|ГДЕ
						|	УникальныеУпаковки_ХамелеонЦРПТ.УИТУпаковки = &УИТУпаковки";
					
					Запрос.УстановитьПараметр("УИТУпаковки", Стр_1.Марка);
					
					РезультатЗапроса = Запрос.Выполнить();
					
					ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
					
					Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
						// Вставить обработку выборки ВыборкаДетальныеЗаписи
						РегСв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
						РегСв.Отбор.УИТ.Установить(ВыборкаДетальныеЗаписи.УИТ);
						Добав=РегСв.Добавить();
						Добав.УИТ=ВыборкаДетальныеЗаписи.УИТ;
						Добав.УИТУпаковки=Стр_1.Марка;
						Добав.УдалитьМарку=Истина;
						РегСв.Записать(Истина);
						ДД=ЭтотОБъект.МаркиОприходовать.Добавить();
						ДД.Марка=ВыборкаДетальныеЗаписи.УИТ;
						ДД.НомерКороба=Стр_1.Марка;
						
					КонецЦикла;
					
					//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
				Конеццикла;
			Иначе
				Для Каждого Стр_1 Из Марки цикл
					//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
					// Данный фрагмент построен конструктором.
					// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
					
					Запрос = Новый Запрос;
					Запрос.Текст = 
						"ВЫБРАТЬ
						|	УникальныеУпаковки_ХамелеонЦРПТ.УИТ,
						|	УникальныеУпаковки_ХамелеонЦРПТ.УдалитьМарку
						|ИЗ
						|	РегистрСведений.УникальныеУпаковки_ХамелеонЦРПТ КАК УникальныеУпаковки_ХамелеонЦРПТ
						|ГДЕ
						|	УникальныеУпаковки_ХамелеонЦРПТ.УИТУпаковки = &УИТУпаковки";
					
					Запрос.УстановитьПараметр("УИТУпаковки", Стр_1.Марка);
					
					РезультатЗапроса = Запрос.Выполнить();
					
					ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
					
					Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
						Если ВыборкаДетальныеЗаписи.УдалитьМарку Тогда
							// Вставить обработку выборки ВыборкаДетальныеЗаписи
							РегСв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
							РегСв.Отбор.УИТ.Установить(ВыборкаДетальныеЗаписи.УИТ);
							РегСв.Записать(Истина);
						КонецЕсли;
						
					КонецЦикла;
					
					//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
				Конеццикла;
				
				
				
			Конецесли;
			
			
			
			Для каждого Стр_1 Из Марки Цикл
				
					//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
					// Данный фрагмент построен конструктором.
					// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
					
					Запрос = Новый Запрос;
					Запрос.Текст = 
						"ВЫБРАТЬ
						|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Продукция
						|ИЗ
						|	РегистрНакопления.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ КАК ОстаткиКМ_в_Обороте_ХамелеонЦРПТ
						|ГДЕ
						|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.СерийныйНомер = &СерийныйНомер";
					
					Запрос.УстановитьПараметр("СерийныйНомер", Стр_1.Марка);
					
					РезультатЗапроса = Запрос.Выполнить();
					
					ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
					Продукция=Неопределено;
					Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
						// Вставить обработку выборки ВыборкаДетальныеЗаписи
						Продукция=ВыборкаДетальныеЗаписи.Продукция;
						Если ЗначениеЗАполнено(Продукция) Тогда
							Прервать;
						Конецесли;
					КонецЦикла;
					
					//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

				
				Если ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМВОбороте Тогда
				
					Добав_1=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
				Иначе
					Добав_1=Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Добавить();
					
				КонецЕсли;
				Добав_1.ВидДвижения=ВидДвиженияНакопления.Расход;
				Добав_1.Количество=1;
				Добав_1.Организация=ЭтотОбъект.Организация;
				Добав_1.Период=Дата;
				Добав_1.Продукция=Продукция;
				Добав_1.СерийныйНомер=Стр_1.Марка;
				
				
				НСТр=ЭтотОбъект.МаркиОприходовать.НайтиСтроки(Новый Структура("НомерКороба",Стр_1.Марка));
				Для каждого Стр_Оп Из НСтр Цикл
					
					Если ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМВОбороте Тогда
					
						Добав_1=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
					Иначе
						Добав_1=Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Добавить();
						
					КонецЕсли;
					Добав_1.ВидДвижения=ВидДвиженияНакопления.Приход;
					Добав_1.Количество=1;
					Добав_1.Организация=ЭтотОбъект.Организация;
					Добав_1.Период=Дата;
					Если СтрДлина(Стр_Оп.Марка)>19 Тогда
						Попытка
							Если Сред(Стр_Оп.Марка,1,2)="01" Тогда
								Добав_1.Продукция=//Продукция;
								Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",
								Число(Сред(Стр_Оп.Марка,3,14)));
							Иначе
								Добав_1.Продукция=//Продукция;
								Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",
								Число(Сред(Стр_Оп.Марка,1,14)));
							Конецесли;
						Исключение
						КонецПопытки;
						Если не ЗначениеЗаполнено(Добав_1.Продукция) Тогда
							
//							Добав_1.СерийныйНомер=Стр_Оп.Марка;
							Добав_1.Продукция=Продукция;
							
						КонецЕсли;
					Иначе
						Добав_1.Продукция=Продукция;
					КонецЕсли;
					Добав_1.СерийныйНомер=Стр_Оп.Марка;
					
					
					
					
					
				КонецЦикла;
				
				
				
				
			КонецЦикла;
			
			
			
						
						
			
		ИначеЕсли ЭтотОбъект.ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.Формирование Тогда
			
			РегДв=РегистрыСведений.ТипКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
			РегДв.Отбор.cis.Установить(ЭтоТОбъект.НомерКороба);
			Добав=РегДв.Добавить();
			Добав.cis=ЭтоТОбъект.НомерКороба;
			Добав.Тип=перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка;
			РегДв.Записать(Истина);
			
			
			
			Если ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМВОбороте Тогда
				
				Добав_1=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
				Добав_1.ВидДвижения=ВидДвиженияНакопления.Приход;
				Добав_1.Количество=1;
				Добав_1.Организация=ЭтотОбъект.Организация;
				Добав_1.Период=Дата;
				Добав_1.СерийныйНомер=ЭтоТОбъект.НомерКороба;
				
				
				Для Каждого Стр Из ЭтотОбъект.Марки Цикл
					Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Если СтрДлина(Стр.Марка)>19 Тогда
						Если Сред(Стр.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,1,14)));
							
						КонецЕсли;
					
						Если Не значениеЗаполнено(Добав_1.Продукция) Тогда
							Добав_1.Продукция=Добав.Продукция;
						КонецЕсли;
					Иначе
						
						
						Добав.Продукция=Стр.Продукция;
						
					КонецЕсли;
					
									
					Добав.СерийныйНомер=Стр.Марка;
					
					
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр.Марка);
					Добав=РегДв.Добавить();
					Добав.УИТ=Стр.Марка;
					Добав.УИТУпаковки=НомерКороба;
					Добав.УдалитьМарку=Ложь;
					РегДв.Записать(Истина);
					
					
				КонецЦикла;
				
				ЭтотОбъект.Продукция=Добав_1.Продукция;
			ИначеЕсли ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМЭмитирован Тогда
				
				Добав_1=Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Добавить();
				Добав_1.ВидДвижения=ВидДвиженияНакопления.Приход;
				Добав_1.Количество=1;
				Добав_1.Организация=ЭтотОбъект.Организация;
				Добав_1.Период=Дата;
				Добав_1.СерийныйНомер=ЭтоТОбъект.НомерКороба;
				
							
				Для Каждого Стр Из ЭтотОбъект.Марки Цикл
					Добав=Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Добавить();
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Если СтрДлина(Стр.Марка)>19 Тогда
						Если Сред(Стр.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,1,14)));
							
						КонецЕсли;
					
					
						Если Не значениеЗаполнено(Добав_1.Продукция) Тогда
							Добав_1.Продукция=Добав.Продукция;
						КонецЕсли;
					Иначе
						
						Добав.Продукция=Стр.Продукция;
						
						
					КонецЕсли;
					
									
					Добав.СерийныйНомер=Стр.Марка;
					
					
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр.Марка);
					Добав=РегДв.Добавить();
					Добав.УИТ=Стр.Марка;
					Добав.УИТУпаковки=НомерКороба;
					Добав.УдалитьМарку=Ложь;
					РегДв.Записать(Истина);
					
					
				КонецЦикла;
				
				ЭтотОбъект.Продукция=Добав_1.Продукция;
				
			Иначе						
				Добав_1=Движения.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Добавить();
				Добав_1.ВидДвижения=ВидДвиженияНакопления.Приход;
				Добав_1.Количество=1;
				Добав_1.Организация=ЭтотОбъект.Организация;
				Добав_1.Период=Дата;
				Добав_1.СерийныйНомер=ЭтоТОбъект.НомерКороба;
				
							
				Для Каждого Стр Из ЭтотОбъект.Марки Цикл
					Добав=Движения.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Добавить();
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Если СтрДлина(Стр.Марка)>19 Тогда
						Если Сред(Стр.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,1,14)));
							
						КонецЕсли;
					
					
						Если Не значениеЗаполнено(Добав_1.Продукция) Тогда
							Добав_1.Продукция=Добав.Продукция;
						КонецЕсли;
					Иначе
						
						Добав.Продукция=Стр.Продукция;
						
						
					КонецЕсли;
					
									
					Добав.СерийныйНомер=Стр.Марка;
					
					
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр.Марка);
					Добав=РегДв.Добавить();
					Добав.УИТ=Стр.Марка;
					Добав.УИТУпаковки=НомерКороба;
					Добав.УдалитьМарку=Ложь;
					РегДв.Записать(Истина);
					
					
				КонецЦикла;
				
				ЭтотОбъект.Продукция=Добав_1.Продукция;
				

			КонецЕсли;
		ИначеЕсли ЭтотОбъект.ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.ИзъятиеИзУпаковки Тогда
			
			
			Для Каждого Стр_1 Из ЭтотОБъект.Марки Цикл
				Если Стр_1.ИзъятьИзУпаковки Тогда
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр_1.Марка);
					РегДв.Записать(Истина);
					
					
					Если ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМВОбороте Тогда
						Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
					Иначе
						Добав=Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Добавить();
					КонецЕсли;
					Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Добав.Продукция=Стр_1.Продукция;
					Если Не значениеЗАполнено(Добав.Продукция) тогда
						Если СтрДлина(Стр_1.Марка)>19 Тогда
						Если Сред(Стр_1.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр_1.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр_1.Марка,1,14)));
							
						КонецЕсли;
						
						
							Если Не значениеЗаполнено(Добав.Продукция) Тогда
								Добав.Продукция=Добав.Продукция;
							КонецЕсли;
						Иначе
							
							
							
						КонецЕсли;
					КонецЕсли;
									
					Добав.СерийныйНомер=Стр_1.Марка;
					
					
					
					
				КонецЕсли;
				
				
				
				
			Конеццикла;
			
		ИначеЕсли ЭтотОбъект.ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.ДобавлениеВУпаковку Тогда
			
			
			
			Если ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМВОбороте Тогда
				
				
				Для Каждого Стр Из ЭтотОбъект.Марки Цикл
					Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Если СтрДлина(Стр.Марка)>19 Тогда
						Если Сред(Стр.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,1,14)));
							
						КонецЕсли;
					
					Иначе
						
						
						Добав.Продукция=Стр.Продукция;
						
					КонецЕсли;
					
									
					Добав.СерийныйНомер=Стр.Марка;
					
							ЭтотОбъект.Продукция=Добав.Продукция;
					
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр.Марка);
					Добав=РегДв.Добавить();
					Добав.УИТ=Стр.Марка;
					Добав.УИТУпаковки=НомерКороба;
					Добав.УдалитьМарку=Ложь;
					РегДв.Записать(Истина);
					
			
				КонецЦикла;
				
			ИначеЕсли ЭтотОбъект.СтатусКМ=Перечисления.СтатусыКМДляАгрегации_ХамелеонЦРПТ.КМЭмитирован Тогда
				
											
				Для Каждого Стр Из ЭтотОбъект.Марки Цикл
					Добав=Движения.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Добавить();
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Если СтрДлина(Стр.Марка)>19 Тогда
						Если Сред(Стр.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,1,14)));
							
						КонецЕсли;
					
					
					Иначе
						
						Добав.Продукция=Стр.Продукция;
						
						
					КонецЕсли;
					
									
					Добав.СерийныйНомер=Стр.Марка;
					
					ЭтотОбъект.Продукция=Добав.Продукция;
					
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр.Марка);
					Добав=РегДв.Добавить();
					Добав.УИТ=Стр.Марка;
					Добав.УИТУпаковки=НомерКороба;
					Добав.УдалитьМарку=Ложь;
					РегДв.Записать(Истина);
					
					
				КонецЦикла;
				
				
			Иначе						
											
				Для Каждого Стр Из ЭтотОбъект.Марки Цикл
					Добав=Движения.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Добавить();
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Если СтрДлина(Стр.Марка)>19 Тогда
						Если Сред(Стр.Марка,1,2)="01" Тогда
						
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,3,14)));
						Иначе
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",Число(Сред(Стр.Марка,1,14)));
							
						КонецЕсли;
					
					
					Иначе
						
						Добав.Продукция=Стр.Продукция;
						
						
					КонецЕсли;
					
									
					Добав.СерийныйНомер=Стр.Марка;
									ЭтотОбъект.Продукция=Добав.Продукция;
			
					
					РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДв.Отбор.УИТ.Установить(Стр.Марка);
					Добав=РегДв.Добавить();
					Добав.УИТ=Стр.Марка;
					Добав.УИТУпаковки=НомерКороба;
					Добав.УдалитьМарку=Ложь;
					РегДв.Записать(Истина);
					
			
				КонецЦикла;
				
				

			КонецЕсли;

			
			
		Конецесли;
		
		
		
	КонецЕслИ;
	
КонецПроцедуры


Процедура ОбработкаУдаленияПроведения(Отказ)
	// Вставить содержимое обработчика.
	Для Каждого Стр Из ЭтотОбъект.БылоДоЭтого Цикл
			
					РегДв=РегистрыСведений.МаркиV3_Сведений_ЦРПТ.СоздатьНаборЗаписей();
				РегДв.Отбор.Марка.Установить(Стр.Марка);
				Добав=РегДв.Добавить();
				Добав.СсылкаНаОбъект=Стр.СсылканаДокумент;
				Добав.Букс=Стр.НомерБокса;
				Добав.Марка=Стр.Марка;
				РегДв.Записать(Истина);
				
			
			
			//	Движение=Движения.МаркиV3_Сведений_ЦРПТ.Добавить();
			//	Движение.Букс=Стр.НомерБокса;
			//	Движение.БуксПаллета=Стр.НомерПаллеты;
			//	Движение.Марка=Стр.Марка;
			//	Движение.СправкаАБ=СправкаАБ.Ссылка;
			//
			
	КонецЦикла;
	
	
	
КонецПроцедуры

Процедура ПриКопировании(ОбъектКопирования)
	// Вставить содержимое обработчика.
	ЭтотОбъект.БылоДоЭтого.Очистить();
	ОшибкаОтправки="";
	Статус="";
	_Order_ID="";
	ВходитВГрупповую=Ложь;
	Агрегации.Очистить();
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)

	ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.Формирование;
	ТипДанныхЗаполнения = ТипЗнч(ДанныеЗаполнения);
		
	Если ДанныеЗаполнения <> Неопределено Тогда
		
		Если ТипДанныхЗаполнения <> Тип("Структура")
			И Метаданные().ВводитсяНаОсновании.Содержит(ДанныеЗаполнения.Метаданные()) Тогда
			ДокументОснование = ДанныеЗаполнения;
		ИначеЕсли ТипДанныхЗаполнения = Тип("Структура")
			И ДанныеЗаполнения.Свойство("Основание")
			И Метаданные().ВводитсяНаОсновании.Содержит(ДанныеЗаполнения.Основание.Метаданные()) Тогда
			ДокументОснование = ДанныеЗаполнения.Основание;
		КонецЕсли;

		
		
		
		Если ДокументОснование <> Неопределено Тогда
			
			Если ТипЗнч(ДокументОснование)=Тип("ДокументСсылка.ВводВОборот_ХамелеонЦРПТ") Тогда
				ДокОснование=Документоснование;
				ЗаполнитьЗначенияСвойств(ЭтотОБъект,ДокОснование,,"Номер,Дата,_Order_ID,Статус");
				Продукция=ДокОснование.Товары[0].GTIN;        
				КомментарийИзЗаказа=ДокОснование.Комментарий;
				Для Каждого Стр_1 Из Документоснование.СерийныеНомера    Цикл
					
					Если ДокументОснование.ТипДокумента=Перечисления.ТипыДокументаВводВОборот_ХамелеонЦРПТ.ОтчетОбИспользовании Тогда
						GGG=РаскодироватьСтроку(Стр_1.cis,СпособКодированияСтроки.КодировкаURL);							
						
						
						
						Если  ТекущийПользователь.СайтыВходаВСистему.Наименование="Фото" Тогда
																		GGG=Сред(GGG,1,38);
							
					ИначеЕсли ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Табак"
						И ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Альтернативный табак" ТОгда 
																		GGG=Сред(GGG,1,31);
												//ШтрихКод=Сред(штрихКод_1,1,Найти(штрихКод_1,"%1D")-1);
												
							Иначе
								
								Если Сред(GGG,1,2)="01" Тогда
									GGG=Сред(GGG,1,25)
								Иначе
									GGG=Сред(GGG,1,21)
								КонецЕсли;
							
												//ШтрихКод=РаскодироватьСтроку(ШтрихКод,СпособКодированияСтроки.КодировкаURL);
								КонецЕсли;
						
					Иначе
						GGG=Стр_1.cis;							
					КонецЕсли;
						Добав=Марки.Добавить();
						Добав.cis=GGG;
						Добав.Марка=Добав.cis;
					//	Добав.Продукция=
				Конеццикла;
				
				
ИначеЕсли ТипЗнч(ДокументОснование)=Тип("ДокументСсылка.ЗаказМарок_ХамелеонЦРПТ") Тогда			  
					  
	
	ДокОснование=Документоснование;
				ЗаполнитьЗначенияСвойств(ЭтотОБъект,ДокОснование,,"Номер,Дата,_Order_ID,Статус");
				Продукция=ДокОснование.Товары[0].GTIN;        
					КомментарийИзЗаказа=ДокОснование.Комментарий;
							
					Для Каждого Стр_1 Из Документоснование.КМИзAPI    Цикл
						GGG=Стр_1.НомерКМ_Короткий;							
						
						Добав=Марки.Добавить();
						Добав.cis=GGG;
						Добав.Марка=Добав.cis;
					//	Добав.Продукция=
				Конеццикла;
				

					  
				  Иначе
					  
					  ДокОснование=ДокументОснование;
					  ЗаполнитьЗначенияСвойств(ЭтотОбъект,ДокОснование,,"Номер,Дата,_Order_ID,Статус");
					  ТипДокумента=перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.Расформирование;
					  //ПриемкаЦРПТ=ДокОснование;
					  
					  Продукция=ДокОснование.Товары[0].GTIN;
					  Для Каждого Стр_1 Из ДокументОснование.СерийныеНомера Цикл
						  Добав=Марки.Добавить();
						  Добав.cis=Стр_1.cis;
						  Добав.Марка=Добав.cis;
						  
						  Нстроки=ДокументОснование.КОроба.НайтиСтроки(Новый Структура("НомерКороба",Стр_1.cis));
						  Для Каждого Стр_ИзКор Из НСтроки Цикл
							  Если МаркиОприходовать.Найти(Стр_ИзКор.Штрихкод,"Марка")=Неопределено Тогда
								  
								  Добав=МаркиОприходовать.Добавить();
								  Добав.Марка=Стр_ИзКор.Штрихкод;
								  Добав.НомерКороба=Стр_1.cis;
								  
								КонецЕсли;
							  
							Конеццикла;
						  
						  
					  Конеццикла;
				  	  
					  
					  
					  
					  
		КонецЕсли;
					//		Для Каждого Стр_1 Из ДокОснование.Товары Цикл
		//			Добав=Товары.Добавить();
		//			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		//			Добав.ДекларацияИлиСертификатСоответствия=РЕгистрыСведений.ПодтверждающиеДокументы_ХамелеонЦРПТ.ПолучитьПоследнее(
		//			ТекущаяДата(),Новый Структура("Продукция",Добав.GTIN)).Документ;
		//			
		//		КонецЦикла;
		//
		//		Для Каждого Стр_1 Из ДокОснование.СерийныеНомера Цикл
		//			Добав=СерийныеНомера.Добавить();
		//			ЗаполнитьЗначенияСвойств(Добав,Стр_1);	
		//			Если Не ЗначениеЗаполнено(Добав.cis) Тогда
		//				Тов=ДокОснование.Товары.Найти(Стр_1.НомерСтрокиСвязи,"НомерСтрокиСвязи");
		//				Добав.cis="01"+Стр_1.GTIN+"21"+Стр_1.СерийныйНомер+"240"+xmlString(Сред(Тов.КодТНВЭД.Код,1,4));
		//			КонецЕсли;
		//		Конеццикла;
	КонецЕсли;
	       
			//ЭтотОбъект.ТипДокумента=Перечисления.ТипыДокументаВводВОборот_ХамелеонЦРПТ.ВводВОборотИмпорт;
			 
			
		КонецЕсли;
		Если	 РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().ОтправлятьПоУмолчаниюАгрегациюЧерезСУЗ 
			
			ИлИ ТекущийПользователь.СайтыВходаВСистему.Наименование="Табак" ИЛИ
			ТекущийПользователь.СайтыВходаВСистему.Наименование="Альтернативный табак" 
			Тогда
	
			ЧерезСУЗ=Истина;
		КонецЕсли;
				
		

КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	// Вставить содержимое обработчика.
	Если Не ЗначениеЗаполнено(ЭтотОбъект.Продукция) 
		И Марки.Количество()>0 И ЗначениеЗаполнено(Марки[0].Продукция) тогда
		 ЭтотОбъект.Продукция=Марки[0].Продукция
	 Конецесли;
	 Фармацевтика=ТекущийПользователь.СайтыВходаВСистему.Наименование="Фармацевтика";
	 КоличествоВКоробе=Марки.Количество();
		 ЭтотОбъект.ЭтоПалет=Ложь;
		 Если ЭтотОбъект.ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.Формирование 
			 ИЛИ ЭтотОбъект.ТипДокумента=Перечисления.ВидДокументаУпаковок_ХамелеонЦРПТ.ДобавлениеВУпаковку
			 Тогда
			 
			 Для Каждого Стр_1 Из Марки Цикл
				 
				 
				 Если СтрДлина(Стр_1.Марка)=18
					 ИЛИ Стр_1.ТипУпаковки=Перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка
					 Тогда
					 ЭтотОБъект.ЭтоПалет=Истина;
					// Прервать;
				 Иначе
					 Если Фармацевтика И Сред(Стр_1.Марка,1,2)="01" Тогда
						 Штрих=Стр_1.Марка;
						 Стр_1.Марка=Сред(Штрих,3,14)+Сред(Штрих,19);

						 
					КонецЕсли;
					 
				 КонецЕсли;
				 
				 
		Конеццикла;
			 
	КонецЕсли;
	 
	 
КонецПроцедуры


