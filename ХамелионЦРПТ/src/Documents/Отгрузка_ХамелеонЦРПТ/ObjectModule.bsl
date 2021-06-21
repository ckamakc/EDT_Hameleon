
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	// Вставить содержимое обработчика.
	
	Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Записывать=Истина;
	Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Очистить();
	
	Движения.Резервы_ХамелеонЦРПТ.Записывать=Истина;
	Движения.Резервы_ХамелеонЦРПТ.Очистить();
	СуммаДОкумента=0;
	Для Каждого Стр Из Товары Цикл
		СуммаДокумента=СуммаДокумента+Стр.КоличествоКМ*Стр.Цена;
	КонецциклА;
	Если ЭтоТОбъект.Статус=перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан
		ИЛИ ЭтоТОбъект.Статус=перечисления.СтатусыДокументов_ХамелеонЦРПТ.ЧастичноПринят
		ИЛИ ЭтоТОбъект.Статус=перечисления.СтатусыДокументов_ХамелеонЦРПТ.ЧерновикОбработан
		ИЛИ
		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Подписан
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ПодписанОтправленВГИСМТ
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Уточнён
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ОжидаетсяОтправка
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ОжидаетсяУточнение
		
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Отправлен
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ПодписьНеТребуется
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ПодписьНеТребуетсяДокументПросмортрен
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ТребуетсяПодпись
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ТребуетсяПодписьДокументПросмотрен
		

		
		
		Тогда
		
		УПДПод=ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Подписан
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ПодписанОтправленВГИСМТ
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Уточнён
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ОжидаетсяОтправка
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ОжидаетсяУточнение
		
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.Отправлен
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ПодписьНеТребуется
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ПодписьНеТребуетсяДокументПросмортрен
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ТребуетсяПодпись
		ИЛИ 		ЭтотОбъект.СтатусУПД=Перечисления.СтатусыУПД_ХамелеонЦРПТ.ТребуетсяПодписьДокументПросмотрен
		;
		
		//Если ЭтотОбъект.СтарыеКоробки.Количество()>0 ТОгда
		УжеБылКороб=Новый Массив;
			Для Каждого Стр Из ЭтотОбъект.СтарыеКоробки Цикл
				
				Если УжеБылКороб.Найти(Стр.НомерКороба)=Неопределено Тогда
					Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
					//Добав.ID_Строки=Стр.ID_строки_партии;
					Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Добав.Продукция=Стр.НаименованиеТовара;
					Добав.СерийныйНомер=Стр.НомерКороба;
					УжеБылКороб.Добавить(Стр.НомерКороба);
				КонецЕсли;
				
					Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
					//Добав.ID_Строки=Стр.ID_строки_партии;
					Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
					Добав.Количество=1;
					Добав.Организация=ЭтотОбъект.Организация;
					Добав.Период=Дата;
					Добав.Продукция=Стр.НаименованиеТовара;
					Добав.СерийныйНомер=Стр.НомерКМ;
									
			КонецЦикла;
		//КонецЕсли;
		
		Для Каждого Стр Из ЭтотОбъект.СерийныеНомера Цикл
			
			Если Стр.Отказано=Истина И НЕ УПДПод Тогда
				Продолжить
			КонецЕсли;
				
			Добав=Движения.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Добавить();
			//Добав.ID_Строки=Стр.ID_строки_партии;
			Добав.ВидДвижения=ВидДвиженияНакопления.Расход;
			Добав.Количество=1;
			Добав.Организация=ЭтотОбъект.Организация;
			Добав.Период=Дата;
			Добав.Продукция=Стр.НаименованиеТовара;
			Добав.СерийныйНомер=Стр.cis;
			
		КонецЦикла;
	Иначе
		//Если Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ОжидаетОтветаОтКлиента
		//ИЛИ Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ПодготовленКОтправке Тогда
		Для Каждого Стр Из ЭтотОбъект.СерийныеНомера Цикл
			Добав=Движения.Резервы_ХамелеонЦРПТ.Добавить();
			//Добав.ID_Строки=Стр.ID_строки_партии;
			Добав.ВидДвижения=ВидДвиженияНакопления.Приход;
			Добав.Количество=1;
			Добав.Организация=ЭтотОбъект.Организация;
			Добав.Период=Дата;
			Добав.СерийныйНомер=Стр.cis;
			
		КонецЦикла;
		
	Конецесли;	
КонецПроцедуры


Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	
	
	ДатаПроизводства=ТекущаяДата();
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
			
			ДокОснование=Документоснование;
			
			Если ТипЗнч(ДокОснование)=Тип("ДокументСсылка.ВводВОборот_ХамелеонЦРПТ") Тогда
				
				ЗаполнитьЗначенияСвойств(ЭтотОБъект,ДокОснование,,"Номер,Дата,_Order_ID,ОшибкаОтправки,Статус");
				Для Каждого Стр_1 Из ДокОснование.Товары Цикл
					Добав=Товары.Добавить();
					ЗаполнитьЗначенияСвойств(Добав,Стр_1);
					Если ЗначениеЗаполнено(ДокОснование.НомерДекларацииТовара) И ЗначениеЗаполнено(Стр_1.GTIN.СтранаПроизводства.Код) Тогда
						
						СпрГТД=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.НайтиГТД(ДокОснование.НомерДекларацииТовара,Стр_1.GTIN.СтранаПроизводства.Код);
						
						Добав.НомерГТД=СпрГТД.Ссылка;
						
					КонецЕсли;
					
					
				КонецЦикла;
				
				
				
		Если ДокОснование.ТипДокумента=Перечисления.ТипыДокументаВводВОборот_ХамелеонЦРПТ.ОтчетОбИспользовании Тогда
			Для Каждого Стр_1 Из ДокОснование.СерийныеНомера Цикл
				
							cis=Стр_1.cis;
			Если Найти(cis,"%1D")>0 Тогда 
				//ИЛИ ТекущийПользователь.СайтыВходаВСистему.Наименование="Молоко" Тогда
				cis=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьКороткийНомерКМ_Сайт(cis,ЭтотОбъект.ТекущийПользователь.СайтыВходаВСистему.Наименование);
			Иначе
				  //cis=СтрЗаменить(cis,Символ(29),"");
					Если ТекущийПользователь.СайтыВходаВСистему.Наименование="Молоко" Тогда
															  Если Сред(cis,32,4)="7003" Тогда	
												 	cis=Сред(cis,1,45);
																									ИначеЕсли Сред(cis,32,2)="17" Тогда
												 	cis=Сред(cis,1,39);
													
												ИначеЕсли СтрДлина(cis)<=30 Тогда
														cis=Сред(cis,1,24);
												Иначе
													cis=Сред(cis,1,31);
													
												КонецЕсли;
											ИначеЕсли ТекущийПользователь.СайтыВходаВСистему.Наименование="Фото" Тогда
												
													cis=Сред(cis,1,38);
												
											Иначе
													cis=Сред(cis,1,31);
												
											КонецЕсли;
											
							КонецЕсли;

						Если ДокОснование.ТекущийПользователь.СайтыВходаВСистему.Наименование="Табак" 
							ИЛИ ДокОснование.ТекущийПользователь.СайтыВходаВСистему.Наименование="Альтернативный табак"
							Тогда
										  cis=РаскодироватьСтроку(cis,СпособКодированияСтроки.КодировкаURL);
										  
					КонецЕсли;
					// Данный фрагмент построен конструктором.
									// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
									
									Запрос = Новый Запрос;
									Запрос.Текст = 
										"ВЫБРАТЬ
										|	СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки.Ссылка.НомерКороба  КАК НомерКороба
										|ИЗ
										|	Документ.СозданиеНовогоШкНаКороба_ХамелеонЦРПТ.Марки КАК СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки
										|ГДЕ
										|	СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки.Ссылка.Проведен
										|	И СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки.Марка = &Марка";
									
									Запрос.УстановитьПараметр("Марка", cis);
									
									РезультатЗапроса = Запрос.Выполнить();
									
									ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
									
									НомерКороба=Неопределено;
									Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
										// Вставить обработку выборки ВыборкаДетальныеЗаписи
										НомерКороба=ВыборкаДетальныеЗаписи.НомерКороба;
									КонецЦикла;
									
									//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

								
								//НомерКороба=НомерКороба;
								Если ЗначениеЗаполнено(НомерКороба) тогда
									cis=НомерКороба;
								КонецЕсли;
								

					Добав=СерийныеНомера.Добавить();
					
					
					ЗаполнитьЗначенияСвойств(Добав,Стр_1);	
					
					
					Добав.cis=cis;					
					
					Если Не ЗначениеЗаполнено(Добав.cis) Тогда
						Тов=ДокОснование.Товары.Найти(Стр_1.НомерСтрокиСвязи,"НомерСтрокиСвязи");
						Добав.cis="01"+Стр_1.GTIN+"21"+Стр_1.СерийныйНомер;
						//+"240"+xmlString(Сред(Тов.КодТНВЭД.Код,1,4));
					КонецЕсли;
						
				Конеццикла;
	
		Иначе
			
			ДокумР=ЭтотОБъект;
			
			Для Каждого Стр_1 Из ДокОснование.СерийныеНомера    Цикл
								GGG=Стр_1.cis;							
								cis=GGG;//Сред(СтрЗаменить(GGG,"%1D",""),1,38);
								
								//Если Сред(cis,32,3)<>"240" Тогда
									//cis=Сред(cis,1,31);
									
								//	cis=Сред(GGG,1,Найти(GGG,"%1D")-1);
								//	cis=РаскодироватьСтроку(cis,СпособКодированияСтроки.КодировкаURL);
//								КонецЕсли;
								
								//Продукция=Неопределено;
								//Для Каждого Стр_1П Из ППП Цикл
								//	Если ЗначениеЗаполнено(Стр_1П.Продукция) Тогда
								//		Продукция=Стр_1П.Продукция
								//	КонецЕсли;
								//	
								//	
								//Конеццикла;
								
								gtin=Сред(cis,3,14);
								
								Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",
								Число(gtin));
								
								
								
								
									//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
									// Данный фрагмент построен конструктором.
									// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
									
									Запрос = Новый Запрос;
									Запрос.Текст = 
										"ВЫБРАТЬ
										|	СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки.Ссылка.НомерКороба  КАК НомерКороба
										|ИЗ
										|	Документ.СозданиеНовогоШкНаКороба_ХамелеонЦРПТ.Марки КАК СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки
										|ГДЕ
										|	СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки.Ссылка.Проведен
										|	И СозданиеНовогоШкНаКороба_ХамелеонЦРПТМарки.Марка = &Марка";
									
									Запрос.УстановитьПараметр("Марка", cis);
									
									РезультатЗапроса = Запрос.Выполнить();
									
									ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
									
									НомерКороба=Неопределено;
									Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
										// Вставить обработку выборки ВыборкаДетальныеЗаписи
										НомерКороба=ВыборкаДетальныеЗаписи.НомерКороба;
									КонецЦикла;
									
									//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

								
								//НомерКороба=НомерКороба;
								Если ЗначениеЗаполнено(НомерКороба) тогда
									cis=НомерКороба;
								КонецЕсли;
								
								
								Если ДокумР.СерийныеНомера.Найти(cis,"cis")=Неопределено Тогда
								
									ДД=ДокумР.СерийныеНомера.Добавить();
									ДД.НаименованиеТовара=Продукция;
									ДД.GTIN=gtin;
									ДД.cis=cis;
									ДД.СерийныйНомер=дд.cis;
								//	Добав=ДокумР.Товары.Найти(ДД.НаименованиеТовара,"GTIN");
								//	Если Добав=Неопределено Тогда
								//		Добав=ДокумР.Товары.Добавить();
								//		Добав.GTIN=ДД.НаименованиеТовара;
								//		Добав.НомерСтрокиСвязи=Добав.НомерСтроки;
								//		Добав.КодТНВЭД=Добав.GTIN.КодТНВЭД;
								//	КонецЕсли;
									ДД.НомерСтрокиСвязи=Стр_1.НомерСтрокиСвязи;
									//Добав.КоличествоКМ=Добав.КоличествоКМ+1;
									//Добав.СпособВыпускаТоваров="";
									
								КонецЕсли;
							КонецЦикла;;
							

				//Для Каждого Стр_1 Из ДокОснование.СерийныеНомера Цикл
				//	Добав=СерийныеНомера.Добавить();
				//	
				//	
				//	ЗаполнитьЗначенияСвойств(Добав,Стр_1);	
				//	
				//	Если Не ЗначениеЗаполнено(Добав.cis) Тогда
				//		Тов=ДокОснование.Товары.Найти(Стр_1.НомерСтрокиСвязи,"НомерСтрокиСвязи");
				//		Добав.cis="01"+Стр_1.GTIN+"21"+Стр_1.СерийныйНомер+"240"+xmlString(Сред(Тов.КодТНВЭД.Код,1,4));
				//	КонецЕсли;
				//		Если ДокОснование.ТекущийПользователь.СайтыВходаВСистему.Наименование="Табак" 
				//			ИЛИ ДокОснование.ТекущийПользователь.СайтыВходаВСистему.Наименование="Альтернативный табак"
				//			Тогда
				//						  Добав.cis=РаскодироватьСтроку(Добав.cis,СпособКодированияСтроки.КодировкаURL);
				//						  
				//	КонецЕсли;
				//Конеццикла;
			КонецЕсли;
		Иначе
			
				ЗаполнитьЗначенияСвойств(ЭтотОБъект,ДокОснование,,"Номер,Дата,_Order_ID,ОшибкаОтправки,Статус,СтатусУПД,ОбратныйАкцепт");
				Контрагент=ДокОснование.Поставщик;
				Договор=ДокОснование.ДоговорПоставщика;
				Для Каждого Стр_1 Из ДокОснование.Товары Цикл
					Добав=Товары.Добавить();
					ЗаполнитьЗначенияСвойств(Добав,Стр_1);
					Добав.НомерСтрокиСвязи=Стр_1.НомерСтрокиСвязи;
					
				КонецЦикла;
				
				
				НСтрокиСвязиЕсть=Новый Массив;
				
				Если ДокОснование.ОбратныйАкцепт Тогда
					Для Каждого Стр_1 Из ДокОснование.Марки Цикл
						Если Стр_1.ПринятОбратныйАкцепт ТОгда
							Добав=СерийныеНомера.Добавить();
							ЗаполнитьЗначенияСвойств(Добав,Стр_1);
							Добав.НомерСтрокиСвязи=Стр_1.НомерСтрокиСвязи;
							Добав.НаименованиеТовара=Стр_1.НаименованиеТовара;
							Добав.cis=Стр_1.Марка;
							
						Конецесли;
					Конеццикла;
				Иначе
					Для Каждого Стр_1 Из ДокОснование.СерийныеНомера Цикл
						Если Стр_1.Принят Тогда
							Добав=СерийныеНомера.Добавить();
							ЗаполнитьЗначенияСвойств(Добав,Стр_1);
							Добав.НомерСтрокиСвязи=Стр_1.НомерСтрокиСвязи;
							Добав.НаименованиеТовара=Стр_1.НаименованиеТовара;
						КонецеслИ;
						
						//Добав.НаименованиеТовара=Стр_1.
						//Если Не ЗначениеЗаполнено(Добав.cis) Тогда
						//	Тов=ДокОснование.Товары.Найти(Стр_1.НомерСтрокиСвязи,"НомерСтрокиСвязи");
						//	Добав.cis="01"+Стр_1.GTIN+"21"+Стр_1.СерийныйНомер+"240"+xmlString(Сред(Тов.КодТНВЭД.Код,1,4));
						//КонецЕсли;
					Конеццикла;
				Конецесли;
				
				

				МаксимумСвязь=0;
				Для Каждого Стр_1 Из Товары Цикл
					Если Стр_1.НомерСтрокиСвязи>МаксимумСвязь Тогда
						МаксимумСвязь=Стр_1.НомерСтрокиСвязи;
						
					КонецЕсли;
				Конеццикла;
				МаксимумСвязь=МаксимумСвязь+1;
				
				
				Для Каждого Стр_1 Из Товары Цикл
					Если НстрокиСвязиЕсть.Найти(Стр_1.НомерСтрокиСвязи)=Неопределено Тогда
						НстрокиСвязиЕсть.Добавить(Стр_1.НомерСтрокиСвязи);
					Иначе
						
						
						НстрокТекущие=СерийныеНомера.НайтиСтроки(Новый Структура("НомерСтрокиСвязи",Стр_1.НомерСтрокиСвязи));
						
						Стр_1.НомерСтрокиСвязи=МаксимумСвязь;
						Для Каждого Стр_22 Из НстрокТекущие Цикл
							Если Стр_22.НаименованиеТовара=Стр_1.GTIN Тогда
								Стр_22.НомерСтрокиСвязи=Стр_1.НомерСтрокиСвязи;
							КонецЕсли;
						Конеццикла;
						МаксимумСвязь=МаксимумСвязь+1;
						
					конецЕсли;
				Конеццикла;
				
				
				
			 Конецесли;
			
		КонецЕсли;
	КонецЕсли;
	
	
	
КонецПроцедуры


Процедура ПриКопировании(ОбъектКопирования)
		ЭтотОБъект._Order_ID="";
	ЭтоТОбъект.Статус="";
	ЭтотОбъект.ОшибкаОтправки="";
	Этотобъект.СтатусУПД="";
	ЭтотОбъект.Order_ID_УПД="";
	ЭтотОбъект.ТипЭДООтправки=НеопределенО;
	ЭтотОбъект.ИмяФайлаЭД="";
	ЭтотОбъект.Исправление=ложь;
	
	ЭтотОбъект.ТипУточненияУПД=Неопределено;
	ЭтотОбъект.ОбратныйАкцепт=Ложь;
КонецПроцедуры


Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Попытка
//	 Заблокировать();
 Исключение
	 Отказ=Истина;
	 Возврат;
	Конецпопытки;
	НСтрокиСвязиЕсть=Новый Массив;
	
	МаксимумСвязь=0;
	Для Каждого Стр_1 Из Товары Цикл
		Если Стр_1.НомерСтрокиСвязи>МаксимумСвязь Тогда
			МаксимумСвязь=Стр_1.НомерСтрокиСвязи;
			
		КонецЕсли;
	Конеццикла;
	МаксимумСвязь=МаксимумСвязь+1;
	
	
	Для Каждого Стр_1 Из Товары Цикл
		Если НстрокиСвязиЕсть.Найти(Стр_1.НомерСтрокиСвязи)=Неопределено Тогда
			НстрокиСвязиЕсть.Добавить(Стр_1.НомерСтрокиСвязи);
		Иначе
			
			
			НстрокТекущие=СерийныеНомера.НайтиСтроки(Новый Структура("НомерСтрокиСвязи",Стр_1.НомерСтрокиСвязи));
			
			Стр_1.НомерСтрокиСвязи=МаксимумСвязь;
			Для Каждого Стр_22 Из НстрокТекущие Цикл
				Если Стр_22.НаименованиеТовара=Стр_1.GTIN Тогда
					Стр_22.НомерСтрокиСвязи=Стр_1.НомерСтрокиСвязи;
				КонецЕсли;
			Конеццикла;
			МаксимумСвязь=МаксимумСвязь+1;
			
		конецЕсли;
	Конеццикла;
	
		СуммаДОкумента=0;
		Для Каждого Стр Из Товары Цикл
			Если ЗначениеЗаполнено(Стр.Сумма) Тогда
		СуммаДокумента=СуммаДокумента+Стр.Сумма;
				Иначе
		СуммаДокумента=СуммаДокумента+Стр.КоличествоКМ*Стр.Цена;
		КонецЕсли;
		Если Не ЗначениеЗаполнено(Стр.ЕдиницаИзмерения) тогда
			Стр.ЕдиницаИзмерения=ТекущийПользователь.ОсновнаяЕдиницаИзмерения;
		КонецЕсли;
	КонецциклА;
	КоличествоКМ=Товары.Итог("КоличествоНомеровКМ");
	Если Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Обработан 
		ИЛИ Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ЧастичноПринят
		
		Тогда
		ВсеОтказные=Истина;
		Для Каждого Стр Из СерийныеНомера	Цикл
			Если Стр.Отказано=Истина Тогда
				Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ЧастичноПринят;
				//Прервать;
			Иначе
				ВсеОтказные=Ложь;
			КонецЕсли;
		Конеццикла;
		Если ВсеОтказные=Истина Тогда
			Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.Отказ;
		КонецЕслИ;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ЭтотОбъект.ПервыйОрдерИД) И ЗначениеЗаполнено(ЭтотОбъект._Order_ID) Тогда
		ПервыйОрдерИД=ЭтотОбъект._Order_ID;
	КонецЕсли;
	Если не ЗначениеЗаполнено(Статус) Тогда
		Статус=Перечисления.СтатусыДокументов_ХамелеонЦРПТ.ПодготовленКОтправке
	КонецЕсли;
	

	
КонецПроцедуры

