

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	// Вставить содержимое обработчика.
	Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Записывать=Истина;
	Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Очистить();
	
	Если ЭтоТОбъект.Статус=перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан
		ИЛИ ЭтотОбъект.Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ЧастичноПринят
		ИЛИ ЭтоТОбъект.Статус=перечисления.СтатусыДокументов_ХамелеонЦРПТ.ФайлОбработанЧастично
		ИЛИ ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Подписан
		
		Тогда
		
		Если ОбратныйАкцепт=Истина Тогда
			Для Каждого Стр Из ЭтотОбъект.Марки Цикл
				
				Если ЗначениеЗаполнено(Стр.СерийныйНомер) Тогда
					РегДв_1=РегистрыСведений.СерийныеНомераДляКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
					РегДВ_1.Отбор.КМ.Установить(Стр.марка);
					Добав=РегДВ_1.Добавить();
					Добав.КМ=Стр.марка;
					Добав.СерийныйНомер=Стр.СерийныйНомер;
					РегДВ_1.Записать(Истина);
					
				КонецЕсли;
				
				Если Стр.ПринятОбратныйАкцепт=Истина
					//ИЛИ Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан
					Тогда	
					
											
						Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
						//Добав.ID_Строки=Стр.ID_строки_партии;
						Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
						Добав.Количество=1;
						Добав.Организация=ЭтотОбъект.Организация;
						Добав.Период=Дата;
						попытка
							Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",ЧИСЛО(Стр.GTIN));
						Исключение
						КонецПопытки;
						Если не ЗначениеЗаполнено(Добав.Продукция) тогда
							ННННТовар=Товары.Найти(Стр.НомерСтрокиСвязи,"НомерСтрокиСвязи");
							Если ННННТовар<>НЕОПРЕДЕЛЕНО тогда
								дОБАВ.Продукция=ННННТовар.GTIN
							конецесли
						КонецЕслИ;
						Добав.СерийныйНомер=Стр.Марка;
					//КонецЕсли;
			    	
 						Если СТРДЛИНА(Стр.Марка)=18 Тогда
											  
						  Нстр=Короба.НайтиСтроки(Новый Структура("НомерКороба",Стр.Марка));
						Для Каждого Стр_ММ Из НСтр Цикл
							
							РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
							РегДв.Отбор.УИТ.Установить(Стр_ММ.ШтрихКод);
							Добав=РегДв.Добавить();
							Добав.УИТ=Стр_ММ.ШтрихКод;
							Добав.УИТУпаковки=Стр.Марка;
							Добав.УдалитьМарку=Ложь;
							РегДв.Записать(Истина);
						КонецЦикла;
						КонецЕсли;
					
				КонецЕсли;
			КонецЦикла;

						
			
		Иначе
				Для Каждого Стр Из СерийныеНомера Цикл
					
					Если ЗначениеЗаполнено(Стр.СерийныйНомер) Тогда
						РегДв_1=РегистрыСведений.СерийныеНомераДляКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
						РегДВ_1.Отбор.КМ.Установить(Стр.cis);
						Добав=РегДВ_1.Добавить();
						Добав.КМ=Стр.cis;
						Добав.СерийныйНомер=Стр.СерийныйНомер;
						РегДВ_1.Записать(Истина);
						
					КонецЕсли;
					
					Если Стр.Принят 
						ИЛИ СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Подписан
						Тогда	
						
						
						Если Стр.Статус="DISAGGREGATION" Тогда
							
							  Нстр=Короба.НайтиСтроки(Новый Структура("НомерКороба",Стр.cis));
							  Если Нстр.Количество()=0 Тогда
								  
				
										Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
										Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
										Добав.Количество=1;
										Добав.Организация=ЭтотОбъект.Организация;
										Добав.Период=Дата;
										Добав.Продукция=Стр.НаименованиеТовара;
										Добав.СерийныйНомер=Стр.cis;
								  
								Иначе
									Для Каждого Стр_ММ Из НСтр Цикл
										
										Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
										Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
										Добав.Количество=1;
										Добав.Организация=ЭтотОбъект.Организация;
										Добав.Период=Дата;
										Добав.Продукция=Стр.НаименованиеТовара;
										Добав.СерийныйНомер=Стр_ММ.ШтрихКод;
										
										
										РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
										РегДв.Отбор.УИТ.Установить(Стр_ММ.ШтрихКод);
										Добав=РегДв.Добавить();
										Добав.УИТ=Стр_ММ.ШтрихКод;
										Добав.УИТУпаковки=Стр.cis;
										Добав.УдалитьМарку=Ложь;
										РегДв.Записать(Истина);
									КонецЦикла;
							КонецЕсли;
							
						Иначе
							
							Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
							//Добав.ID_Строки=Стр.ID_строки_партии;
							Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
							Добав.Количество=1;
							Добав.Организация=ЭтотОбъект.Организация;
							Добав.Период=Дата;
							Добав.Продукция=Стр.НаименованиеТовара;
							Добав.СерийныйНомер=Стр.cis;
						//КонецЕсли;
				    	
				          Если Стр.ТипУпаковки=Перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка Тогда
							  
							  Нстр=Короба.НайтиСтроки(Новый Структура("НомерКороба",Стр.cis));
							Для Каждого Стр_ММ Из НСтр Цикл
								
								РегДв=РегистрыСведений.УникальныеУпаковки_ХамелеонЦРПТ.СоздатьНаборЗаписей();
								РегДв.Отбор.УИТ.Установить(Стр_ММ.ШтрихКод);
								Добав=РегДв.Добавить();
								Добав.УИТ=Стр_ММ.ШтрихКод;
								Добав.УИТУпаковки=Стр.cis;
								Добав.УдалитьМарку=Ложь;
								РегДв.Записать(Истина);
							КонецЦикла;
							КонецЕсли;
							
							
						КонецЕсли;
					КонецЕсли;
				КонецЦикла;
				
				
				
				
			КонецЕсли;
			
			Если РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().ПриПроведенииПриемкиПриходоватьКМВоВложении=Истина Тогда
				
				МассивОприходоваил=Новый Массив;
				
			
				
				Для Каждого Стр_1 Из Короба Цикл
					ШтрихкодПриходуем=Стр_1.ШтрихКод;
					Если ЗначениеЗаполнено(ШтрихкодПриходуем) Тогда
						Если СерийныеНомера.Найти(ШтрихкодПриходуем,"cis")<>Неопределено Тогда
							Продолжить;
						Конецесли;
						Если ОбратныйАкцепт=Истина И Марки.Найти(ШтрихкодПриходуем,"Марка")<>Неопределено Тогда
							Продолжить;
						Конецесли;
						Если МассивОприходоваил.Найти(ШтрихкодПриходуем)=Неопределено тогда
							МассивОприходоваил.Добавить(ШтрихкодПриходуем);
							
							Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
							Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
							Добав.Количество=1;
							Добав.Организация=ЭтотОбъект.Организация;
							Добав.Период=Дата;
							Попытка
								ГТИН=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьGTINСМарки(ШтрихкодПриходуем);
								Добав.Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",число(ГТИН));
							Исключение
							КонецПопытки;
							Добав.СерийныйНомер=ШтрихкодПриходуем;
							
							
						Конецесли;
						
					Конецесли;
					
				Конеццикла;
				
			Конецесли;

		//КонецЕсли;
	
	Конецесли;	
	
КонецПроцедуры


Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	Попытка
//	 Заблокировать();
 Исключение
	 Отказ=Истина;
	 Возврат;
	Конецпопытки;
	
	ЕстьМарки=СерийныеНомера.Количество()>0;
	
	СуммаДОкумента=0;
		
	КоличествоКМ=0;
	ВсеПриняты=Истина;	
	СуммаПринято=0;
	
	Для Каждого Стр Из Товары Цикл
		
		//Если ЗначениеЗаполнено(Стр.Сумма) тогда
		//	СуммаДОкумента=Стр.Сумма 
		
		//КонецЕсли;
		
		КоличествоКМ_1=Стр.КоличествоКМ;
		Если ЭтотОбъект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Фармацевтика"
			Тогда
			Если ЗначениеЗаполнено(Стр.КоличествоНомеровКМ) тогда
				КоличествоКМ_1=Стр.КоличествоНомеровКМ;
			КонецЕсли;
		КонецЕсли;
		СуммаДокумента=СуммаДокумента+КоличествоКМ_1*Стр.Цена;
		
	КонецциклА;
	
	
	
	Отказано=Истина;
	
	СуммаНДСПРинят=0;
	
	ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ=Новый ТаблицаЗначений;
	ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Колонки.Добавить("cis");
	ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Колонки.Добавить("Тип");
	ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Индексы.Добавить("cis");
	
	
	Для каждого Стр_11 Из Короба Цикл
		Если ЗначениеЗаполнено(Стр_11.ТипУпаковки) 
			И ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Найти(Стр_11.ШтрихКод,"cis")=Неопределено тогда
			
			РегДв=РегистрыСведений.ТипКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
			РегДв.Отбор.cis.Установить(Стр_11.ШтрихКод);
			РегДв.Записать(Истина);
			

				Добав_1=ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Добавить();
				Добав_1.cis=Стр_11.ШтрихКод;
				Добав_1.Тип=Стр_11.ТипУпаковки;
			
		КонецЕсли;
	Конеццикла;
	
	
	Если СерийныеНомера.Количество()>0 тогда
		Для Каждого Стр Из СерийныеНомера Цикл
			Если ЗначениеЗаполнено(Стр.ТипУпаковки) 
			И ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Найти(Стр.cis,"cis")=Неопределено тогда
				РегДв=РегистрыСведений.ТипКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
				РегДв.Отбор.cis.Установить(Стр.cis);
				РегДв.Записать(Истина);
				
				Добав_1=ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ.Добавить();
				Добав_1.cis=Стр.cis;
				Добав_1.Тип=Стр.ТипУпаковки;
				
			КонецЕслИ;
			
					Если СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Подписан Тогда
						Стр.Принят=Истина;

					КонецЕсли;

			
			Если Стр.Принят Тогда
				КоличествоКМ=КоличествоКМ+1;
				
				Коэффициент=1;
				Если ЭтотОбъект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Фармацевтика" Тогда
					Това=Товары.Найти(Стр.НомерСтрокиСвязи,"НомерСтрокиСвязи");
					Если Това<>Неопределено тогда
						Если Това.КоличествоНомеровКМ<>0 
							И Това.КоличествоКМ<>0 Тогда
							Коэффициент=Това.КоличествоНомеровКМ/Това.КоличествоКМ
						КонецЕсли;
					КонецЕсли;
				ИначеЕсли ЭтотОбъект.УПД Тогда
					
					Това=Товары.Найти(Стр.НомерСтрокиСвязи,"НомерСтрокиСвязи");
					Если Това<>Неопределено тогда
						Если Това.КоличествоНомеровКМ<>0 Тогда
							Коэффициент=Това.КоличествоКМ/Това.КоличествоНомеровКМ
						КонецЕсли;
					КонецЕсли;					
				КонецЕсли;
				СуммаПринято=СуммаПринято+Стр.Цена*Коэффициент;
				СуммаНДСПРинят=СуммаНДСПРинят+Стр.НДС*Коэффициент;
				Отказано=Ложь;
			Иначе
				ВсеПриняты=Ложь;
			Конецесли;
		Конеццикла;
		
		Если Отказано=Истина И Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан Тогда
			Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Отказ;
		ИначеЕсли ВсеПриняты=Ложь И Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан Тогда
			Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ЧастичноПринят;
			
		ИначеЕсли ВсеПриняты=Истина 
			И Товары.Количество()>0
			И СерийныеНомера.Количество()>0
			Тогда
			Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан;
		КонецЕсли;
	КонецЕсли;
	
			РегДв=РегистрыСведений.ТипКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
						РегДв.Загрузить(ТаблицаДляЗаписиВТипКМ_ХамелеонЦРПТ);
						РегДв.Записать(Ложь);
	
	
	//КоличествоКМ=Товары.Итог("КоличествоКМ");
	КоличествоНомеровКМ=Товары.Итог("КоличествоНомеровКМ");
	Отсканировано=Марки.Количество();
КонецПроцедуры


Процедура ПриКопировании(ОбъектКопирования)
	// Вставить содержимое обработчика.
	ДокументОтгрузки="";
	_Order_ID="";
	ТипЭДО="";
	Статус="";
	СтатусУПД="";
	ОшибкаОтправки="";
КонецПроцедуры

