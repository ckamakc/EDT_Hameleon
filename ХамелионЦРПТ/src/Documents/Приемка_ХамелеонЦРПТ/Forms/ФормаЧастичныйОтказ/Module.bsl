
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ЗаписыватьДанныеПриОтправкеЗаказа=РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().ЗаписыватьДанныеПриОтправкеЗаказа;
										   ОбработкаWEBНаСервере=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ОбработкаWEBНаСервере();

	// Вставить содержимое обработчика.
	Параметры.Свойство("СсылкаНаОъект",СсылкаНаОъект);
	Если Не ЗначениеЗаполнено(СсылкаНаОъект) тогда
		Отказ=Истина;
		Возврат;
	КонецЕсли;
	
	Параметры.Свойство("ТекущийПользователь",ТекущийПользователь);
	
	//Добав_Дерево=ДеревоКМ.ПолучитьЭлементы().Добавить();
//	НомерКороба="лываождпждловапаждладжллапджждвааьиьллалавжжв";
	Для Каждого СТр_2 Из СсылкаНаОъект.Короба Цикл
		//ДеревоКМ.ПолучитьЭлементы()[0].
		//Для Каждого Стр_20 Из ДеревоКМ.ПолучитьЭлементы() Цикл
			
		//	Если Стр_20.НомерКМ=Стр_2.НомерКороба Тогда
		//		ДобавитьмаркуДальше=Стр_20
				
		//	КонецЕслИ;
			
		//Конеццикла;
		Для Каждого Стр_Дерево Из ДеревоКМ.ПолучитьЭлементы() Цикл
			Если Стр_Дерево.Уровень=1 Тогда
				Продолжить;
			Конецесли;
			Нстр=РекурсияНайдемСтрочку(Стр_Дерево,Стр_2.НомерКороба);
			Если НСтр<>Неопределено Тогда
				Прервать;
			КонецЕсли;
		Конеццикла;
		Если НСтр=неопределено Тогда
			Добав_Стр_Д=ДеревоКМ.ПолучитьЭлементы().Добавить();
			Добав_Стр_Д.НомерКМ=Стр_2.НомерКороба;
			Добав_Стр_Д.cis=Стр_2.НомерКороба;
			Добав_Стр_Д.Уровень=0;
			
			Стр_33=НомераКМДубль.Добавить();
			Стр_33.НомерКМ=Стр_2.НомерКороба;
			Стр_33.Связь=Добав_Стр_Д.ПолучитьИдентификатор();
			
			
			
			
		Иначе
			Добав_Стр_Д=НСтр;
			
		Конецесли;
		Добав_М_=Добав_Стр_Д.ПолучитьЭлементы().Добавить();
		Добав_М_.НомерКМ=Стр_2.ШтрихКод;
		Добав_М_.cis=Стр_2.ШтрихКод;
		Стр_33=НомераКМДубль.Добавить();
		Стр_33.НомерКМ=Стр_2.ШтрихКод;
		Стр_33.Связь=Добав_М_.ПолучитьИдентификатор();
		Если СтрДлина(Добав_М_.cis)<>18 Тогда
			Добав_М_.Уровень=1;
			Добав_М_.КоличествоКМ=1;
			
		КонецЕсли;
		//Если   НомерКороба<>СТр_2.НомерКороба Тогда
			
		//КонецЕслИ;
		
	Конеццикла;
	
	
	
	Для Каждого Стр_1 Из СсылкаНаОъект.Товары Цикл
		Добав=ТаблицаТоваров.Добавить();
		Добав.Товар=Стр_1.GTIN;
		Добав.Количество=Стр_1.КоличествоКМ;
		Добав.НомерСвязи=Стр_1.НомерСтрокиСвязи;
		Добав.Количество=Стр_1.КоличествоКМ;
		Добав.КоличествоКМ=Стр_1.КоличествоНомеровКМ;
		
	Конеццикла;
	Для Каждого Стр_22 Из СсылкаНаОъект.СерийныеНомера Цикл
		
		Если СсылкаНаОъект.Короба.Найти(Стр_22.cis,"НомерКороба")= Неопределено Тогда
			//Добав_Стр_Д=ДеревоКМ.ПолучитьЭлементы().Добавить();
			Добав_М_=ДеревоКМ.ПолучитьЭлементы().Добавить();
			Добав_М_.НомерКМ=Стр_22.cis;
			Добав_М_.cis=Стр_22.cis;
			Стр_33=НомераКМДубль.Добавить();
			Стр_33.НомерКМ=Стр_22.cis;
			Стр_33.Связь=Добав_М_.ПолучитьИдентификатор();
			Если СтрДлина(Добав_М_.cis)<>18 Тогда
				Добав_М_.Уровень=1;
				
			КонецЕсли;
			Добав_М_.КоличествоКМ=1;
			

			
		КонецЕсли;
		
		Добав=ТаблицаКМ.Добавить();
		Добав.Продукция=Стр_22.НаименованиеТовара;
		Добав.НомерСвязи=Стр_22.НомерСтрокиСвязи;
		Добав.НомерСерийный=Стр_22.cis;
		Добав.Отметка=ЛожЬ;
	Конеццикла;
	
	
	Для Каждого Стр_22 Из СсылкаНаОъект.Марки Цикл
		НайтиМарку=ТаблицаКМ.НайтиСтроки(Новый Структура("НомерСерийный",Стр_22.Марка));
		Если НайтиМарку.Количество()=0 ТОгда
			
			Стр_Н=НомераКМДубль.НайтиСтроки(Новый Структура("НомерКМ",Стр_22.Марка));
			Если Стр_Н.Количество()=0 Тогда
				Добав=ЛишниеМарки.Добавить();
				Добав.марка=Стр_22.Марка;
			Иначе
				ДДД=ДеревоКМ.НайтиПоИдентификатору(Стр_Н[0].Связь);
				ДДД.Принят=Истина;
				ДДД.КоличествоОтсканировано=ДДД.КоличествоОтсканировано+1;
			Конецесли;
		Иначе
			
			НайтиМарку[0].Отметка=Истина;
			
			Товвар=ТаблицаТоваров.НайтиСтроки(Новый структура("НомерСвязи",НайтиМарку[0].НомерСвязи));
			Товвар[0].КоличествоСканированоКМ=Товвар[0].КоличествоСканированоКМ+1;
			
		КонецеслИ;
		
		Добав_11=Отсканировано.Добавить();
		Добав_11.КМ=Стр_22.Марка;
		
	Конеццикла;
	
	
	Для Каждого Стр_1 Из ДеревоКМ.ПолучитьЭлементы() Цикл
		Если СсылкаНаОъект.Марки.Количество()=0 Тогда
			Стр_1.Принят=ИстинА;
		КонецЕсли;
		РекурсияСуммы(Стр_1);
		Если СсылкаНаОъект.Марки.Количество()=0 Тогда
			Стр_1.КоличествоОтсканировано=Стр_1.КоличествоКМ;
		КонецЕслИ;
		
	Конеццикла;
	
	Для Каждого Стр_1 Из ДеревоКМ.ПолучитьЭлементы() Цикл
		Если Стр_1.КоличествоОтсканировано>=Стр_1.КоличествоКМ Тогда
			
			Штрихкод=Стр_1.НомерКМ;
			НСтрок=ТаблицаКМ.НайтиСтроки(Новый Структура("НомерСерийный",Штрихкод));
			Для Каждого Стр_222 Из НСтрок Цикл
				Стр_222.Отметка=Истина;
				Строк=ТаблицаТоваров.НайтиСтроки(Новый Структура("НомерСвязи",Стр_222.НомерСвязи));
				Если СТрок.Количество()>0 Тогда
					СТрок[0].КоличествоСканированоКМ=СТрок[0].КоличествоСканированоКМ+1;
				Конецесли;
			Конеццикла;
			
			
		Конецесли;
		
		//Если Стр_1.Принят=Истина Тогда
		//	Стр_1.КоличествоОтсканировано=Стр_1.Количество;
		//КонецЕсли;
	Конеццикла;
	
	
	
	
КонецПроцедуры
Процедура РекурсияСуммы(Стр_1)
	
	Для Каждого Стр_2 Из Стр_1.ПолучитьЭлементы() Цикл
		
		РекурсияСуммы(Стр_2);
		Стр_1.КоличествоОтсканировано=Стр_1.КоличествоОтсканировано+Стр_2.КоличествоОтсканировано;
		Стр_1.КоличествоКМ=Стр_1.КоличествоКМ+Стр_2.КоличествоКМ;
		
		Если Стр_1.Принят=Истина Тогда
			
			Стр_1.КоличествоОтсканировано=Стр_1.КоличествоКМ
		КонецЕсли;
		
	Конеццикла;
	
КонецПроцедуры


Функция РекурсияНайдемСтрочку(Стр_Дерево_1,НомерКороба)
	Если Стр_Дерево_1.НомерКМ=НомерКороба Тогда
		Возврат Стр_Дерево_1
	КонецЕсли;
	Для Каждого Стр_Д Из стр_Дерево_1.ПолучитьЭЛементы() Цикл
		Если Стр_Дерево_1.Уровень=1 Тогда
			Продолжить;
		Конецесли;		
		Стр_Дерево_2=РекурсияНайдемСтрочку(Стр_Д,НомерКороба);
		Если Стр_Дерево_2<>Неопределено Тогда
			Возврат Стр_Дерево_2
		КонецЕсли;
	Конеццикла;
	
	Возврат Неопределено
	
	
КонецФункции

&НаКлиенте
Процедура ТаблицаКМПередУдалением(Элемент, Отказ)
	// Вставить содержимое обработчика.
	Отказ=Истина
КонецПроцедуры

Функция ПолучитьИзПользователя(Ссылк)
	Если Ссылк.Организация.ИНН=ТекущийПользователь.Организация.ИНН 
		И Ссылк.ТекущийПользователь.СайтыВходаВСистему=ТекущийПользователь.СайтыВходаВСистему Тогда
		Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Текущийпользователь);
	ИначеЕсли Ссылк.ТекущийПользователь.ПометкаУдаления=ЛОЖЬ ТОгда
		Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Ссылк.ТекущийПользователь);
		
	Иначе
		
		//Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Ссылк.П
			//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Пользователи_ХамелеонЦРПТ.Ссылка
		|ИЗ
		|	Справочник.Пользователи_ХамелеонЦРПТ КАК Пользователи_ХамелеонЦРПТ
		|ГДЕ
		|	Пользователи_ХамелеонЦРПТ.Организация.ИНН = &Организация
		|	И Пользователи_ХамелеонЦРПТ.СайтыВходаВСистему = &СайтыВходаВСистему
		|	И НЕ Пользователи_ХамелеонЦРПТ.ПометкаУдаления";
	
	Запрос.УстановитьПараметр("Организация", Ссылк.ТекущийПользователь.Организация.ИНН);
	Запрос.УстановитьПараметр("СайтыВходаВСистему", Ссылк.ТекущийПользователь.СайтыВходаВСистему);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	НайтиПольз=Неопределено;
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
		                      НайтиПольз=ВыборкаДетальныеЗаписи.Ссылка
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

		
		//НайтиПольз=Справочники.Пользователи_ХамелеонЦРПТ.НайтиПоРеквизиту("Организация",Объект.Организация);
		Если ЗначениеЗаполнено(НайтиПольз) Тогда
			Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(НайтиПольз);
		КонецЕсли;
		
	КонецЕслИ;
	
//	Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Ссылк.ТекущийПользователь);
КонецФункции


Функция СформироватьXmlФайлИмпорт(Отказ=Ложь)
	ПолОБ=СсылкаНаОъект.ПолучитьОбъект();
	ПолОБ.ЧастичныйОтказ.Очистить();
		Чтен=Новый  ЗаписьJSON;
		Чтен.УстановитьСтроку(Новый ПараметрыЗаписиJSON());
		Чтен.ЗаписатьНачалоОбъекта();
		Чтен.ЗаписатьИмяСвойства("request_type");
		Чтен.ЗаписатьЗначение("ACCEPTANCE");
		Чтен.ЗаписатьИмяСвойства("release_order_number");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.ДокументОтгрузки);
		Чтен.ЗаписатьИмяСвойства("products");
		Чтен.ЗаписатьНачалоМассива();
		
		Для Каждого Стр Из СсылкаНаОъект.СерийныеНомера Цикл
			Чтен.ЗаписатьНачалоОбъекта();
			Если СтрДлина(Стр.cis)=18 Тогда
				Чтен.ЗаписатьИмяСвойства("uitu_code");
				Чтен.ЗаписатьЗначение(Стр.cis);
				Чтен.ЗаписатьИмяСвойства("product_description");
				Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
				Чтен.ЗаписатьИмяСвойства("product_cost");
				Чтен.ЗаписатьЗначение(xmlString(Стр.Цена*100));
				Чтен.ЗаписатьИмяСвойства("product_tax");
				Чтен.ЗаписатьЗначение(xmlString(Стр.НДС*100));
				Чтен.ЗаписатьИмяСвойства("accepted");
				
				
				Нстрок=ТаблицаКМ.НайтиСтроки(Новый Структура("НомерСерийный",Стр.cis));
				Если НСТрок.Количество()>0 Тогда
						Добав=ПолОб.ЧастичныйОтказ.Добавить();
						Добав.cis=Стр.cis;
						Добав.Принят=Нстрок[0].Отметка;
						
						Добав.ПервыйУровень=Стр.cis;
						
					Если Нстрок[0].Отметка=Истина Тогда
						Чтен.ЗаписатьЗначение("true");
						
						
					Иначе
						Чтен.ЗаписатьЗначение("false");
					КонецЕсли;
					
				КонецЕсли;
				
				
				
				Чтен.ЗаписатьКонецОбъекта();
				
			Иначе
				Чтен.ЗаписатьИмяСвойства("uit_code");
				Чтен.ЗаписатьЗначение(Стр.cis);
				Чтен.ЗаписатьИмяСвойства("product_description");
				Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
				Чтен.ЗаписатьИмяСвойства("product_cost");
				Чтен.ЗаписатьЗначение(xmlString(Стр.Цена));
				Чтен.ЗаписатьИмяСвойства("product_tax");
				Чтен.ЗаписатьЗначение(xmlString(Стр.НДС));
				Чтен.ЗаписатьИмяСвойства("accepted");
							Нстрок=ТаблицаКМ.НайтиСтроки(Новый Структура("НомерСерийный",Стр.cis));
							Если НСТрок.Количество()>0 Тогда
						Добав=ПолОб.ЧастичныйОтказ.Добавить();
						Добав.cis=Стр.cis;
						Добав.Принят=Нстрок[0].Отметка;
						Добав.ПервыйУровень=Стр.cis;
								
					Если Нстрок[0].Отметка=Истина Тогда
						Чтен.ЗаписатьЗначение("true");
					Иначе
						Чтен.ЗаписатьЗначение("false");
					КонецЕсли;
					
				КонецЕсли;
				Чтен.ЗаписатьКонецОбъекта();
				
				
			КонецЕслИ;
		Конеццикла;
		ПолОб.Записать();
		
		
		Чтен.ЗаписатьКонецМассива();
		Чтен.ЗаписатьИмяСвойства("document_date");
		Чтен.ЗаписатьЗначение(Формат(СсылкаНаОъект.ДатаВходящий,"ДФ=""гггг-ММ-ддT00:00:00""")+".000Z");
		Чтен.ЗаписатьИмяСвойства("transfer_date");
		Чтен.ЗаписатьЗначение(Формат(КонецДня(СсылкаНаОъект.ДатаПолуччения),"ДФ=""гггг-ММ-ддTЧЧ:мм:сс""")+".000Z");
		Чтен.ЗаписатьИмяСвойства("document_number");
		Если ЗначениеЗаполнено(СсылкаНаОъект.НомерВходящий) тогда
			Чтен.ЗаписатьЗначение(СсылкаНаОъект.НомерВходящий);
		Иначе
			Чтен.ЗаписатьЗначение(СсылкаНаОъект.Номер);
		КонецЕсли;
		
		Чтен.ЗаписатьИмяСвойства("trade_sender_inn");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Поставщик.ИНН);
		Чтен.ЗаписатьИмяСвойства("trade_owner_inn");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Организация.ИНН);
		Чтен.ЗаписатьИмяСвойства("trade_recipient_inn");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Организация.ИНН);
		
		
		Чтен.ЗаписатьИмяСвойства("trade_sender_name");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Поставщик.Наименование);
		Чтен.ЗаписатьИмяСвойства("rade_owner_name");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Организация.Наименование);
		Чтен.ЗаписатьИмяСвойства("turnover_type");
		Если ЗначениеЗаполнено(СсылкаНаОъект.ВидТоварооборота) тогда
			Чтен.ЗаписатьЗначение(xmlString(СсылкаНаОъект.ВидТоварооборота));
		Иначе
		
			Чтен.ЗаписатьЗначение("SELLING");
		КонецЕсли;
//		Чтен.ЗаписатьЗначение("SELLING");
		Чтен.ЗаписатьИмяСвойства("acceptance_date");
		Чтен.ЗаписатьЗначение(Формат(КонецДня(СсылкаНаОъект.ДатаПолуччения),"ДФ=""гггг-ММ-ддTЧЧ:мм:сс""")+".000Z");
		Чтен.ЗаписатьКонецОбъекта();
					
		
		
		Текст=Чтен.Закрыть();
	
	
	  	Если 	ЗаписыватьДанныеПриОтправкеЗаказа тогда
			ЗапишемВРегистр_Акт(Текст);
		КонецЕсли;

	Возврат Текст;
КонецФункции

	Процедура ЗапишемВРегистр_Акт(ТекстДокумент)
	РегДв=РегистрыСведений.ОтправленныеПолученные_ХамелеонЦРПТ.СоздатьНаборЗаписей();
	РегДв.Отбор.Документ.Установить(СсылкаНаОъект.Ссылка);
	РегДв.Отбор.Вид.Установить("Акт о решении");
	Добав=РегДв.Добавить();
	Добав.Документ=СсылкаНаОъект.Ссылка;
	Добав.Вид="Акт о решении";
	Добав.Файл=Новый ХранилищеЗначения(ТекстДокумент,Новый СжатиеДанных(9));
	РегДв.Записать(Истина);
КонецПроцедуры




&НаСервереБезКонтекста
Процедура ОчиститьТокенСрегистра(ТТ)
	ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаписатьТокенВРегистр(ТТ,"")
КонецПроцедуры

Процедура ЗапишемВРегистр_Ответ(ТекстДокумент)
	РегДв=РегистрыСведений.ОтправленныеПолученные_ХамелеонЦРПТ.СоздатьНаборЗаписей();
	РегДв.Отбор.Документ.Установить(СсылкаНаОъект.Ссылка);
	РегДв.Отбор.Вид.Установить("Получили ответ");
	Добав=РегДв.Добавить();
	Добав.Документ=СсылкаНаОъект.Ссылка;
	Добав.Вид="Получили ответ";
	Добав.Файл=Новый ХранилищеЗначения(ТекстДокумент,Новый СжатиеДанных(9));
	РегДв.Записать(Истина);
КонецПроцедуры


Функция ВернутьСтатус(Д)
	Возврат Д.Статус
Конецфункции

&НаКлиенте
Процедура ОтправитьВЦРПТ(Команда,УжеОтправили=Ложь)
	// Вставить содержимое обработчика.
 	// Вставить содержимое обработчика.
	
	Если ВернутьСтатус(СсылкаНаОъект)=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОжидаетОтветаОтКлиента") Тогда
		
		Thumbprint_1=ПолучитьИзПользователя(СсылкаНаОъект);	
		
		СРегистра=Thumbprint_1.ТокенПоОтпечатку;
		Если Не ЗначениеЗаполнено(СРегистра) тогда
			Попытка
				СРегистра=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1);	
			исключение
				СРегистра=Неопределено;
			КонецПопытки;
		КонецЕсли;
		Если Не ЗначениеЗаполнено(СРегистра) Тогда
			ПоказатьПредупреждение(,"Не удалось получить токен по организации");
			Возврат;
		Конецесли;
		
		
			СформироватьФайлДляОтправки=СформироватьXmlФайлИмпорт();
	 				СформироватьФайлДляОтправки=СтрЗаменить(СформироватьФайлДляОтправки,Символы.ПС," ");
				СформироватьФайлДляОтправки=СтрЗаменить(СформироватьФайлДляОтправки,Символы.ВК," ");
			
		Подписанный="";
		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайл(Thumbprint_1.Внешняя,СформироватьФайлДляОтправки,Thumbprint_1,Подписанный,Истина);
		
		//Подписанный=base64Строка(ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(
		//Подписанный,КодировкаТекста.UTF8,Ложь));
		
					Подписанный=СтрЗаменить(Подписанный,Символы.ПС,"\r\n");
				Подписанный=СтрЗаменить(Подписанный,Символы.ВК,"\r\n");
				Подписанный=СтрЗаменить(Подписанный,"\r\n","");
		
		
		Добав=base64Строка(ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(
		СформироватьФайлДляОтправки,КодировкаТекста.UTF8,Ложь));
					Добав=СтрЗаменить(Добав,Символы.ПС,"\r\n");
				Добав=СтрЗаменить(Добав,Символы.ВК,"\r\n");
				Добав=СтрЗаменить(Добав,"\r\n","");

		Тело="{
		|""product_document"":"""+Добав+""",
		|""document_format"": ""MANUAL"",
		|""signature"":"""+Подписанный+"""}";
		
		
	 	Если ОбработкаWEBНаСервере Тогда
		//Если НЕ ЗагрузканаСервереПринять(Thumbprint_1,СРегистра,УжеОтправили,Тело) Тогда
		//		Если УжеОтправили=Истина Тогда
		//		//ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1)
		//	Иначе
		//		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1);
		//		ОтправитьВЦРПТ(Команда,Истина)			
		//КонецЕсли
		
		//КонецЕсли;
		
		
	Иначе
				Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
					Прокси=Новый ИнтернетПрокси;
					Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
				             
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресКАПИ,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				Иначе
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресКАПИ,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				КонецЕсли;
				
				
						
 			что=Thumbprint_1.что;
	
				
				
			HTTPЗапрос=Новый HTTPЗапрос("api/v3/lk/documents/acceptance/create?pg="+Что);
		HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
		HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+СРегистра);
		//HTTPЗапрос.Заголовки.Вставить("Host","ismotp.crptech.ru");
		///Константин           
		HTTPЗапрос.УстановитьТелоИзСтроки(Тело);
		Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
		Текст1=Ответ.ПолучитьТелоКакСтроку();
		
		Если 	ЗаписыватьДанныеПриОтправкеЗаказа тогда
			ЗапишемВРегистр_Ответ(Текст1);
		КонецЕсли;
			
		
		
		Если Ответ.КодСостояния=202 ИЛИ Ответ.КодСостояния=200 
			ИЛИ Ответ.КодСостояния=201 
			Тогда
			
			ЗаписатьОтветОтправлен(Текст1);
				
		ИначеЕсли Ответ.КодСостояния=401 		ИЛИ Ответ.КодСостояния=502    Тогда
				Если УжеОтправили=Истина Тогда
					ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1)
				Иначе
					ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1);
					ОтправитьВЦРПТ(Команда,Истина);
					ЭтаФорма.Закрыть();
					Сообщить("Отказ отправлен в ЦРПТ");
				КонецЕсли;
		Иначе
			//	Если УжеОтправили=Истина Тогда
//			ЗаписатьОтказВДокумент(Текст1);
			//	Иначе
			//		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1,ЭтаФорма,"ПодписатьФайлПослеПолученияТокена");
			//		ОтправитьЗаявку(Команда,Истина)			
			//	КонецЕсли
		КонецЕсли;
		         КонецЕсли;
		//ЭтаФорма.Записать();
	КонецЕсли;
	
	ЭтаФорма.Закрыть();
КонецПроцедуры
Процедура ЗаписатьОтветОтправлен(Текст1)
	Объект=СсылкаНаОъект.ПолучитьОбъект();
				Объект.Статус=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.Отправлен");
				Объект._Order_ID=Текст1;
				      Объект.Записать();
	
Конецпроцедуры

Процедура ЗаписатьОтказВДокумент(Текст1)
	ООб=СсылкаНаОъект.ПолучитьОбъект();
						ООб.Статус=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.Отказ");
						Попытка
							//ЧтениеJSON = Новый ЧтениеJSON;
							//ЧтениеJSON.УстановитьСтроку(Текст1);
							NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Текст1);//ПрочитатьJSON(ЧтениеJSON);
							попытка
								
								ООб.ОшибкаОтправки=NNN.error_message;
							Исключение
								Попытка
									ООб.ОшибкаОтправки=NNN.error_description;
									Если NNN.error="access_denied" Тогда
										Сообщить(NNN.error_description+" "+" сайт ЦРПТ не доступен. Повторите отправку позже");
									КонецЕсли;
								Исключение
								КонецПопытки;
								
							КонецПопытки;
							
						Исключение
						КонецПопытки;
						ООб.Записать();
					КонецПроцедуры
					
					
Функция СформирватьЗаписьРекурсия(Чтен,Стр1,ПолОб,МаркаВерхняя)
	Если Стр1.Принят Тогда
		Чтен.ЗаписатьНачалоОбъекта();
		
		Если СтрДлина(Стр1.cis)=18 Тогда
			Чтен.ЗаписатьИмяСвойства("uitu_code");
			Чтен.ЗаписатьЗначение(Стр1.cis);
			
			Стр=СсылкаНаОъект.СерийныеНомера.Найти(Стр1.cis,"cis");
			Если Стр<>Неопределено Тогда
				
				Чтен.ЗаписатьИмяСвойства("product_description");
				Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
				
				Чтен.ЗаписатьИмяСвойства("product_cost");
				Чтен.ЗаписатьЗначение(xmlString(Стр.Цена*100));
				Чтен.ЗаписатьИмяСвойства("product_tax");
				Чтен.ЗаписатьЗначение(xmlString(Стр.НДС*100));
				
			КонецЕсли;	
			Чтен.ЗаписатьИмяСвойства("accepted");
			Чтен.ЗаписатьЗначение("true");
						Добав=ПолОб.ЧастичныйОтказ.Добавить();
						Добав.cis=Стр1.cis;						
						Добав.ПервыйУровень=МаркаВерхняя;
						Добав.Принят=Истина;
		
		Иначе
			Чтен.ЗаписатьИмяСвойства("uit_code");
			Чтен.ЗаписатьЗначение(Стр1.cis);
			Стр=СсылкаНаОъект.СерийныеНомера.Найти(Стр1.cis,"cis");
			Если Стр<>Неопределено Тогда
				Чтен.ЗаписатьИмяСвойства("product_description");
				Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
				Чтен.ЗаписатьИмяСвойства("product_cost");
				Чтен.ЗаписатьЗначение(xmlString(Стр.Цена));
				Чтен.ЗаписатьИмяСвойства("product_tax");
				Чтен.ЗаписатьЗначение(xmlString(Стр.НДС));
			Конецесли;
			Чтен.ЗаписатьИмяСвойства("accepted");
			Чтен.ЗаписатьЗначение("true");
									Добав=ПолОб.ЧастичныйОтказ.Добавить();
						Добав.cis=Стр1.cis;
						Добав.Принят=Истина;
						
						Добав.ПервыйУровень=МаркаВерхняя;

			
			
		КонецЕслИ;
		Чтен.ЗаписатьКонецОбъекта();
			
	Иначе
		
		Чтен.ЗаписатьНачалоОбъекта();
		
		Если СтрДлина(Стр1.cis)=18 Тогда
			Чтен.ЗаписатьИмяСвойства("uitu_code");
			Чтен.ЗаписатьЗначение(Стр1.cis);
			
			Чтен.ЗАписатьИмяСвойства("children");
			Чтен.ЗаписатьНачалоМассива();
			
			Для Каждого Стр_20 Из Стр1.ПолучитьЭлементы() Цикл
				СформирватьЗаписьРекурсия(Чтен,Стр_20,ПолОб,МаркаВерхняя);
			Конеццикла;
			
			Чтен.ЗаписатьКонецМассива();
			
			Чтен.ЗаписатьИмяСвойства("count_children");
			Чтен.ЗаписатьЗначение(xmlString(Стр1.ПолучитьЭлементы().Количество()));
			
			Стр=СсылкаНаОъект.СерийныеНомера.Найти(Стр1.cis,"cis");
			Если Стр<>Неопределено Тогда
				
				Чтен.ЗаписатьИмяСвойства("product_description");
				Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
				
				Чтен.ЗаписатьИмяСвойства("product_cost");
				Чтен.ЗаписатьЗначение(xmlString(Стр.Цена*100));
				Чтен.ЗаписатьИмяСвойства("product_tax");
				Чтен.ЗаписатьЗначение(xmlString(Стр.НДС*100));
				
			КонецЕсли;	
			Чтен.ЗаписатьИмяСвойства("accepted");
			Чтен.ЗаписатьЗначение("false");
			
						Добав=ПолОб.ЧастичныйОтказ.Добавить();
						Добав.cis=Стр1.cis;
						Добав.Принят=Ложь;
						Добав.ПервыйУровень=МаркаВерхняя;
						
			
			//Чтен.ЗаписатьКонецОбъекта();
			
		Иначе
			Чтен.ЗаписатьИмяСвойства("uit_code");
			Чтен.ЗаписатьЗначение(Стр1.cis);
			Стр=СсылкаНаОъект.СерийныеНомера.Найти(Стр1.cis,"cis");
			Если Стр<>Неопределено Тогда
				Чтен.ЗаписатьИмяСвойства("product_description");
				Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
				Чтен.ЗаписатьИмяСвойства("product_cost");
				Чтен.ЗаписатьЗначение(xmlString(Стр.Цена));
				Чтен.ЗаписатьИмяСвойства("product_tax");
				Чтен.ЗаписатьЗначение(xmlString(Стр.НДС));
			Конецесли;
			Чтен.ЗаписатьИмяСвойства("accepted");
			Чтен.ЗаписатьЗначение("false");
			
						Добав=ПолОб.ЧастичныйОтказ.Добавить();
						Добав.cis=Стр1.cis;
						Добав.Принят=Ложь;
						Добав.ПервыйУровень=МаркаВерхняя;
						
			
			//Чтен.ЗаписатьКонецОбъекта();
			
			
		КонецЕслИ;		
		
		Чтен.ЗаписатьКонецОбъекта();
	
		
	КонецЕсли;
	
	
КонецФункции
					
Функция СформироватьXmlФайлИмпортДерево(Отказ=Ложь)
		Чтен=Новый  ЗаписьJSON;
		Чтен.УстановитьСтроку(Новый ПараметрыЗаписиJSON());
		Чтен.ЗаписатьНачалоОбъекта();
		Чтен.ЗаписатьИмяСвойства("request_type");
		Чтен.ЗаписатьЗначение("ACCEPTANCE");
		Чтен.ЗаписатьИмяСвойства("release_order_number");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.ДокументОтгрузки);
		Чтен.ЗаписатьИмяСвойства("products");
		Чтен.ЗаписатьНачалоМассива();
	ПолОБ=СсылкаНаОъект.ПолучитьОбъект();
	ПолОБ.ЧастичныйОтказ.Очистить();
		
	Для Каждого Стр1 Из ДеревоКМ.ПолучитьЭлементы() ЦИкл
		СформирватьЗаписьРекурсия(Чтен,Стр1,ПолОб,Стр1.cis);
	Конеццикла;
	
	ПолОБ.Записать(РежимЗаписиДокумента.Запись);
		
		
		//
		//Для Каждого Стр Из СсылкаНаОъект.СерийныеНомера Цикл
		//	Чтен.ЗаписатьНачалоОбъекта();
		//	Если СтрДлина(Стр.cis)=18 Тогда
		//		Чтен.ЗаписатьИмяСвойства("uitu_code");
		//		Чтен.ЗаписатьЗначение(Стр.cis);
		//		Чтен.ЗаписатьИмяСвойства("product_description");
		//		Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
		//		Чтен.ЗаписатьИмяСвойства("product_cost");
		//		Чтен.ЗаписатьЗначение(xmlString(Стр.Цена*100));
		//		Чтен.ЗаписатьИмяСвойства("product_tax");
		//		Чтен.ЗаписатьЗначение(xmlString(Стр.НДС*100));
		//		Чтен.ЗаписатьИмяСвойства("accepted");
		//		
		//		
		//		Нстрок=ТаблицаКМ.НайтиСтроки(Новый Структура("НомерСерийный",Стр.cis));
		//		Если НСТрок.Количество()>0 Тогда
		//			Если Нстрок[0].Отметка=Истина Тогда
		//				Чтен.ЗаписатьЗначение("true");
		//			Иначе
		//				Чтен.ЗаписатьЗначение("false");
		//			КонецЕсли;
		//			
		//		КонецЕсли;
		//		Чтен.ЗаписатьКонецОбъекта();
		//		
		//	Иначе
		//		Чтен.ЗаписатьИмяСвойства("uit_code");
		//		Чтен.ЗаписатьЗначение(Стр.cis);
		//		Чтен.ЗаписатьИмяСвойства("product_description");
		//		Чтен.ЗаписатьЗначение(Стр.НаименованиеТовараСтрокой);
		//		Чтен.ЗаписатьИмяСвойства("product_cost");
		//		Чтен.ЗаписатьЗначение(xmlString(Стр.Цена));
		//		Чтен.ЗаписатьИмяСвойства("product_tax");
		//		Чтен.ЗаписатьЗначение(xmlString(Стр.НДС));
		//		Чтен.ЗаписатьИмяСвойства("accepted");
		//					Нстрок=ТаблицаКМ.НайтиСтроки(Новый Структура("НомерСерийный",Стр.cis));
		//		Если НСТрок.Количество()>0 Тогда
		//			Если Нстрок[0].Отметка=Истина Тогда
		//				Чтен.ЗаписатьЗначение("true");
		//			Иначе
		//				Чтен.ЗаписатьЗначение("false");
		//			КонецЕсли;
		//			
		//		КонецЕсли;
		//		Чтен.ЗаписатьКонецОбъекта();
		//		
		//		
		//	КонецЕслИ;
		//Конеццикла;
		Чтен.ЗаписатьКонецМассива();
		Чтен.ЗаписатьИмяСвойства("document_date");
		Чтен.ЗаписатьЗначение(Формат(СсылкаНаОъект.ДатаВходящий,"ДФ=""гггг-ММ-ддT00:00:00""")+".000Z");
		Чтен.ЗаписатьИмяСвойства("transfer_date");
		Чтен.ЗаписатьЗначение(Формат(КонецДня(СсылкаНаОъект.ДатаПолуччения),"ДФ=""гггг-ММ-ддTЧЧ:мм:сс""")+".000Z");
		Чтен.ЗаписатьИмяСвойства("document_number");
		Если ЗначениеЗаполнено(СсылкаНаОъект.НомерВходящий) тогда
			Чтен.ЗаписатьЗначение(СсылкаНаОъект.НомерВходящий);
		Иначе
			Чтен.ЗаписатьЗначение(СсылкаНаОъект.Номер);
		КонецЕсли;
		
		Чтен.ЗаписатьИмяСвойства("trade_sender_inn");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Поставщик.ИНН);
		Чтен.ЗаписатьИмяСвойства("trade_owner_inn");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Организация.ИНН);
		Чтен.ЗаписатьИмяСвойства("trade_recipient_inn");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Организация.ИНН);
		
		
		Чтен.ЗаписатьИмяСвойства("trade_sender_name");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Поставщик.Наименование);
		Чтен.ЗаписатьИмяСвойства("rade_owner_name");
		Чтен.ЗаписатьЗначение(СсылкаНаОъект.Организация.Наименование);
		Чтен.ЗаписатьИмяСвойства("turnover_type");
		Если ЗначениеЗаполнено(СсылкаНаОъект.ВидТоварооборота) тогда
			Чтен.ЗаписатьЗначение(xmlString(СсылкаНаОъект.ВидТоварооборота));
		Иначе
		
			Чтен.ЗаписатьЗначение("SELLING");
		КонецЕсли;
//		Чтен.ЗаписатьЗначение("SELLING");
		Чтен.ЗаписатьИмяСвойства("acceptance_date");
		Чтен.ЗаписатьЗначение(Формат(КонецДня(СсылкаНаОъект.ДатаПолуччения),"ДФ=""гггг-ММ-ддTЧЧ:мм:сс""")+".000Z");
		Чтен.ЗаписатьКонецОбъекта();
					
		
		
		Текст=Чтен.Закрыть();
	
	
	  	Если 	ЗаписыватьДанныеПриОтправкеЗаказа тогда
			ЗапишемВРегистр_Акт(Текст);
		КонецЕсли;

	
	Возврат Текст;
КонецФункции


					
&НаКлиенте
Процедура ОтправитьЧастичныйОтказПоДереву(Команда,УжеОтправили=Ложь)
	// Вставить содержимое обработчика.
	
	
	Если ВернутьСтатус(СсылкаНаОъект)=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОжидаетОтветаОтКлиента") Тогда
		
		Thumbprint_1=ПолучитьИзПользователя(СсылкаНаОъект);	
		
		СРегистра=Thumbprint_1.ТокенПоОтпечатку;
		Если Не ЗначениеЗаполнено(СРегистра) тогда
			Попытка
				СРегистра=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1);	
			исключение
				СРегистра=Неопределено;
			КонецПопытки;
		КонецЕсли;
		Если Не ЗначениеЗаполнено(СРегистра) Тогда
			ПоказатьПредупреждение(,"Не удалось получить токен по организации");
			Возврат;
		Конецесли;
		
		
			СформироватьФайлДляОтправки=СформироватьXmlФайлИмпортДерево();
	 				СформироватьФайлДляОтправки=СтрЗаменить(СформироватьФайлДляОтправки,Символы.ПС," ");
				СформироватьФайлДляОтправки=СтрЗаменить(СформироватьФайлДляОтправки,Символы.ВК," ");
			
		Подписанный="";
		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайл(Thumbprint_1.Внешняя,СформироватьФайлДляОтправки,Thumbprint_1,Подписанный,Истина);
		
		//Подписанный=base64Строка(ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(
		//Подписанный,КодировкаТекста.UTF8,Ложь));
		
					Подписанный=СтрЗаменить(Подписанный,Символы.ПС,"\r\n");
				Подписанный=СтрЗаменить(Подписанный,Символы.ВК,"\r\n");
				Подписанный=СтрЗаменить(Подписанный,"\r\n","");
		
		
		Добав=base64Строка(ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(
		СформироватьФайлДляОтправки,КодировкаТекста.UTF8,Ложь));
					Добав=СтрЗаменить(Добав,Символы.ПС,"\r\n");
				Добав=СтрЗаменить(Добав,Символы.ВК,"\r\n");
				Добав=СтрЗаменить(Добав,"\r\n","");

		Тело="{
		|""product_document"":"""+Добав+""",
		|""document_format"": ""MANUAL"",
		|""signature"":"""+Подписанный+"""}";
		
		
	 	Если ОбработкаWEBНаСервере Тогда
		//Если НЕ ЗагрузканаСервереПринять(Thumbprint_1,СРегистра,УжеОтправили,Тело) Тогда
		//		Если УжеОтправили=Истина Тогда
		//		//ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1)
		//	Иначе
		//		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1);
		//		ОтправитьВЦРПТ(Команда,Истина)			
		//КонецЕсли
		
		//КонецЕсли;
		
		
	Иначе
				Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
					Прокси=Новый ИнтернетПрокси;
					Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
				             
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресКАПИ,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				Иначе
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресКАПИ,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				КонецЕсли;
				
				
						
 			что=Thumbprint_1.что;
	
				
				
			HTTPЗапрос=Новый HTTPЗапрос("api/v3/lk/documents/acceptance/create?pg="+Что);
		HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
		HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+СРегистра);
		//HTTPЗапрос.Заголовки.Вставить("Host","ismotp.crptech.ru");
		///Константин           
		HTTPЗапрос.УстановитьТелоИзСтроки(Тело);
		Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
		Текст1=Ответ.ПолучитьТелоКакСтроку();
		
		Если 	ЗаписыватьДанныеПриОтправкеЗаказа тогда
			ЗапишемВРегистр_Ответ(Текст1);
		КонецЕсли;
			
		
		
		Если Ответ.КодСостояния=202 ИЛИ Ответ.КодСостояния=200 
			ИЛИ Ответ.КодСостояния=201 
			Тогда
			
			ЗаписатьОтветОтправлен(Текст1);
				
		ИначеЕсли Ответ.КодСостояния=401 		ИЛИ Ответ.КодСостояния=502    Тогда
				Если УжеОтправили=Истина Тогда
					ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1)
				Иначе
					ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1);
					ОтправитьЧастичныйОтказПоДереву(Команда,Истина);
					ЭтаФорма.Закрыть();
					Сообщить("Отказ отправлен в ЦРПТ");
				КонецЕсли;
		Иначе
			//	Если УжеОтправили=Истина Тогда
//			ЗаписатьОтказВДокумент(Текст1);
			//	Иначе
			//		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1,ЭтаФорма,"ПодписатьФайлПослеПолученияТокена");
			//		ОтправитьЗаявку(Команда,Истина)			
			//	КонецЕсли
		КонецЕсли;
		         КонецЕсли;
		//ЭтаФорма.Записать();
	КонецЕсли;
	
	ЭтаФорма.Закрыть();
	
КонецПроцедуры


&НаКлиенте
Процедура ДеревоКМТаблицаПринятПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ДД=ДеревоКМ.НайтиПоИдентификатору(Элементы.ДеревоКМТаблица.ТекущиеДанные.ПолучитьИдентификатор());
		ДД_1=ДД;
		Родит=ДД_1.ПолучитьРодителя();
		Пока Родит<>Неопределено Цикл
			Родит.Принят=ЛожЬ;
			Родит=Родит.ПолучитьРодителя()
		Конеццикла;
	Если ДД.Принят=Истина Тогда
		
		
		
		
		РекурсияИстина(ДД);
	
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура РекурсияИстина(Стр_З)
	Для Каждого Стр_1 Из Стр_З.ПолучитьЭлементы() Цикл
		Стр_1.Принят=Истина;
		РекурсияИстина(Стр_1)
	Конеццикла;
	
КонецПроцедуры