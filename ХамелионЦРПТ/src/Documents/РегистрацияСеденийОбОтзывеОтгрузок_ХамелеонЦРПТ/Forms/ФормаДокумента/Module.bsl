&НаСервереБезКонтекста
Функция дополнитьСтроку(Ср)
	ВОзврат Обработки._Запуск_ХамелеонЦРПТ.ДополнитьСтроку_11(Ср,14,"0");
	
Конецфункции


Функция СформироватьXmlФайлИмпорт(Thumbprint_1)
	
	Если Типзнч(Объект.ДокументОснование)=Тип("ДокументСсылка.Отгрузка_ХамелеонЦРПТ") тогда
				
				
				//МассивТекстов=Новый Массив;
				Чтение=Новый ЗаписьXML;
				Чтение.УстановитьСтроку("UTF-8");
				Чтение.ЗаписатьОбъявлениеXML();
				Чтение.ЗаписатьНачалоЭлемента("documents");
				Чтение.ЗаписатьАтрибут("version","1.35");
			 	
				Чтение.ЗаписатьНачалоЭлемента("refusal_sender");
				Чтение.ЗаписатьАтрибут("action_id","251");
				
				Чтение.ЗаписатьНачалоЭлемента("subject_id");
				Чтение.ЗаписатьТекст(Объект.ДокументОснование.ДоговорОрганизации.РегистрационныйНомер);
				Чтение.ЗаписатьКонецЭлемента();
				
				
				Чтение.ЗаписатьНачалоЭлемента("operation_date");
				///Если Найти(Thumbprint_1.АдресКАПИ,"api")=1 Тогда
					
					//Время=ПолучитьЧасовойПоясИнформационнойБазы();
	Прибавка="Z";
		Если ЗначениеЗаполнено(Объект.ТекущийПользователь.ПлюсЧасовойПоясДляЛекарств) тогда
			Прибавка=Обработки._Запуск_ХамелеонЦРПТ.ДополнитьСтроку_11(Объект.ТекущийПользователь.ПлюсЧасовойПоясДляЛекарств,2,"0");
			Если Объект.ТекущийПользователь.ПлюсЧасовойПоясДляЛекарств>0 Тогда
				     Прибавка="+"+Прибавка+":00";
			Иначе
				     Прибавка="-"+Прибавка+":00";
			Конецесли;
		Конецесли;
					
					Чтение.ЗаписатьТекст(Формат(Объект.Дата,"ДФ=""гггг-ММ-ддTЧЧ:мм:сс""")+Прибавка);
			//	Иначе
			//		Чтение.ЗаписатьТекст(Формат(Объект.Дата,"ДФ=""гггг-ММ-ддTЧЧ:мм:ссZ"""));
				
			//	конецесли;
				Чтение.ЗаписатьКонецЭлемента();
				
				Чтение.ЗаписатьНачалоЭлемента("receiver_id");
				Чтение.ЗаписатьТекст(Объект.ДокументОснование.Договор.РегистрационныйНомер);
				Чтение.ЗаписатьКонецЭлемента();
				
				
				Чтение.ЗаписатьНачалоЭлемента("reason");
				Чтение.ЗаписатьТекст(Объект.ПричинаОтзыва);
				Чтение.ЗаписатьКонецЭлемента();
				
					Чтение.ЗаписатьНачалоЭлемента("order_details");
			Для Каждого Стр_1 Из Объект.ДокументОснование.Товары Цикл
				
				//Чтение.ЗаписатьНачалоЭлемента("signs");
				//НСтрок=Объект.ДокументОснование.СерийныеНомера.НайтиСтроки(Новый Структура("gtin",ДополнитьСтроку(xmlString(Стр_1.gtin.gtin))));
				НСтрок=Объект.ДокументОснование.СерийныеНомера.НайтиСтроки(Новый Структура("НомерСТрокиСвязи",Стр_1.НомерСтрокиСвязи));
				Для Каждого Стр_c Из НСтрок Цикл
				//	Чтение.ЗаписатьНачалоЭлемента("union");
				
					Штрих=Стр_c.cis;
					Если СтрДлина(Штрих)=18 Тогда
						Чтение.ЗаписатьНачалоЭлемента("sscc");
					Иначе
						Чтение.ЗаписатьНачалоЭлемента("sgtin");
					КонецЕсли;
					
					Если Сред(Штрих,1,2)="01" ТОгда
						Штрих=Сред(Штрих,3,14)+Сред(Штрих,19);
					КонецЕсли;
					
					Чтение.ЗаписатьТекст(Штрих);
					
					Чтение.ЗаписатьКонецЭлемента();
				////s	Чтение.ЗаписатьКонецЭлемента();
					
					
			 	//Чтение.ЗаписатьКонецЭлемента();
					
				Конеццикла;
			Конеццикла;
				Чтение.ЗаписатьКонецЭлемента();
				Чтение.ЗаписатьКонецЭлемента();
				Чтение.ЗаписатьКонецЭлемента();
	Иначе
				
		
		
		
		
		
				//МассивТекстов=Новый Массив;
				Чтение=Новый ЗаписьXML;
				Чтение.УстановитьСтроку("UTF-8");
				Чтение.ЗаписатьОбъявлениеXML();
				Чтение.ЗаписатьНачалоЭлемента("documents");
				Чтение.ЗаписатьАтрибут("version","1.35");
			 	
				Чтение.ЗаписатьНачалоЭлемента("refusal_sender");
				Чтение.ЗаписатьАтрибут("action_id","251");
				
				Чтение.ЗаписатьНачалоЭлемента("subject_id");
				Чтение.ЗаписатьТекст(Объект.ДокументОснование.ДоговорОрганизации.РегистрационныйНомер);
				Чтение.ЗаписатьКонецЭлемента();
				
				
				Чтение.ЗаписатьНачалоЭлемента("operation_date");
				Если Найти(Thumbprint_1.АдресКАПИ,"api")=1 Тогда
					
					//Время=ПолучитьЧасовойПоясИнформационнойБазы();
					
					Чтение.ЗаписатьТекст(Формат(Объект.Дата,"ДФ=""гггг-ММ-ддTЧЧ:мм:сс""")+"+00:00");
				Иначе
					Чтение.ЗаписатьТекст(Формат(Объект.Дата,"ДФ=""гггг-ММ-ддTЧЧ:мм:ссZ"""));
				
				конецесли;
				Чтение.ЗаписатьКонецЭлемента();
				
				Чтение.ЗаписатьНачалоЭлемента("receiver_id");
				Чтение.ЗаписатьТекст(Объект.ДокументОснование.ДоговорПоставщика.РегистрационныйНомер);
				Чтение.ЗаписатьКонецЭлемента();
				
				
				Чтение.ЗаписатьНачалоЭлемента("reason");
				Чтение.ЗаписатьТекст(Объект.ПричинаОтзыва);
				Чтение.ЗаписатьКонецЭлемента();
				
					Чтение.ЗаписатьНачалоЭлемента("order_details");
			Для Каждого Стр_1 Из Объект.ДокументОснование.Марки Цикл
				
				//Чтение.ЗаписатьНачалоЭлемента("signs");
				//НСтрок=Объект.ДокументОснование.СерийныеНомера.НайтиСтроки(Новый Структура("gtin",ДополнитьСтроку(xmlString(Стр_1.gtin.gtin))));
				//НСтрок=Объект.ДокументОснование.СерийныеНомера.НайтиСтроки(Новый Структура("НомерСТрокиСвязи",Стр_1.НомерСтрокиСвязи));
				//Для Каждого Стр_c Из НСтрок Цикл
				//	Чтение.ЗаписатьНачалоЭлемента("union");
				
					Штрих=Стр_c.Марка;
					Если СтрДлина(Штрих)=18 Тогда
						Чтение.ЗаписатьНачалоЭлемента("sscc");
					Иначе
						Чтение.ЗаписатьНачалоЭлемента("sgtin");
					КонецЕсли;
					
					Если Сред(Штрих,1,2)="01" ТОгда
						Штрих=Сред(Штрих,3,14)+Сред(Штрих,19);
					КонецЕсли;
					
					Чтение.ЗаписатьТекст(Штрих);
					
					Чтение.ЗаписатьКонецЭлемента();
				////s	Чтение.ЗаписатьКонецЭлемента();
					
					
			 	//Чтение.ЗаписатьКонецЭлемента();
					
				//Конеццикла;
			Конеццикла;
				Чтение.ЗаписатьКонецЭлемента();
				Чтение.ЗаписатьКонецЭлемента();
				Чтение.ЗаписатьКонецЭлемента();
				
	КонецЕсли;
	Текст=Чтение.Закрыть();
Возврат Текст 	
КонецФункции


&НаКлиенте
Процедура ОтправитьВЦРПТ(Команда,УжеОтправили=Ложь)
	// Вставить содержимое обработчика.
	// Вставить содержимое обработчика.
	Thumbprint_1=ПолучитьИзПользователя();	
//	ЭтаФорма.Записать();
	
	
Если Не ЗначениеЗаполнено(ОБъект.ДокументОснование) Тогда
	Сообщить("Не заполнен документ основания");
Возврат;
КонецЕсли;

Если Не ЗначениеЗаполнено(ОБъект.ПричинаОтзыва) Тогда
	Сообщить("Не заполнена причина отзыва");
Возврат;
КонецЕсли;
	

		СформироватьФайлДляОтправки=СформироватьXmlФайлИмпорт(Thumbprint_1);
		Попытка
		//	Если НеПрошлаПроверкаИмпорт(СформироватьФайлДляОтправки) Тогда
		//		Объект.ОшибкаОтправки="Проверка документа не прошла по схеме xsd";
				//ПоказатьПредупреждение("");
		//		Возврат;
				
		//	КонецЕсли;
			
			
		Исключение
		КонецПопытки;
			
			
			
		СРегистра=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена_ЛДМП(Thumbprint_1);	
		
		СформироватьФайлДляОтправки=СтрЗаменить(СформироватьФайлДляОтправки,Символы.ПС,"");
		СформироватьФайлДляОтправки=СтрЗаменить(СформироватьФайлДляОтправки,Символы.ВК,"");
		
		
		
		Добав=base64Строка(ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(
		СформироватьФайлДляОтправки,КодировкаТекста.UTF8,Ложь));
					Добав=СтрЗаменить(Добав,Символы.ПС,"\r\n");
				Добав=СтрЗаменить(Добав,Символы.ВК,"\r\n");
				Добав=СтрЗаменить(Добав,"\r\n","");

				
				Подписанный="";
		//ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайл(Thumbprint_1.Внешняя,СформироватьФайлДляОтправки ,Thumbprint_1.Thumbprint_1,Подписанный,Истина);
//		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайл_ЛДМП(СформироватьФайлДляОтправки ,Thumbprint_1.Thumbprint_1,Подписанный,Ложь);
			//Если Найти(Thumbprint_1.АдресКАПИ,"api")=1 Тогда
				ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайл(Thumbprint_1.Внешняя,СформироватьФайлДляОтправки ,Thumbprint_1.Thumbprint_1,Подписанный,Истина);
			//Иначе
			//	ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайл_ЛДМП(СформироватьФайлДляОтправки ,Thumbprint_1.Thumbprint_1,Подписанный,Ложь);
				
				
			//КонецЕсли;



		//Подписанный=base64Строка(ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(
		//Подписанный,КодировкаТекста.UTF8,Ложь));
		
					Подписанный=СтрЗаменить(Подписанный,Символы.ПС,"\r\n");
				Подписанный=СтрЗаменить(Подписанный,Символы.ВК,"");
				 Подписанный=СтрЗаменить(Подписанный,"\r\n","");
				
				 
	Чтен=Новый  ЗаписьJSON;
	Чтен.УстановитьСтроку(Новый ПараметрыЗаписиJSON());
	Чтен.ЗаписатьНачалоОбъекта();
	Чтен.ЗаписатьИмяСвойства("document");
	Чтен.ЗаписатьЗначение(Добав);
	Чтен.ЗаписатьИмяСвойства("sign");
	Чтен.ЗаписатьЗначение(Подписанный);
	Чтен.ЗаписатьИмяСвойства("request_id");
	Чтен.ЗаписатьЗначение(ВернутьУНИКУМ());
	Чтен.ЗаписатьКонецОбъекта();
	Тело=Чтен.Закрыть();
	
				 
				 
		//Тело="{
		//|""doc_type"":""311"",
		//|""document"":"""+Добав+""",
		//|""sign"":"""+Подписанный+""",
		//|""request_id"":"""+ВернутьУНИКУМ()+"
		//|}";
			
				Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
					Прокси=Новый ИнтернетПрокси;
					Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
				
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресКАПИ,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				Иначе
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресКАПИ,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				КонецЕсли;
		
			HTTPЗапрос=Новый HTTPЗапрос("api/v1/documents/send");
		HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
		HTTPЗапрос.Заголовки.Вставить("Authorization","token "+СРегистра);
		//HTTPЗапрос.Заголовки.Вставить("Host","ismotp.crptech.ru");
		///Константин           
		HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8);
		Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
		ОбщийМодуль_НаСервере_ХамелеонЦРПТ.Задержка_Номральная(1);
	
		Текст1=Ответ.ПолучитьТелоКакСтроку();
		
	Если Ответ.КодСостояния=200 ИЛИ Ответ.КодСостояния=200  Тогда
			Объект.Статус=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОтправленЧерновик");
				//ЧтениеJSON = Новый ЧтениеJSON;
				//ЧтениеJSON.УстановитьСтроку(Текст1);
				NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Текст1);//ПрочитатьJSON(ЧтениеJSON);
			Объект._Order_ID=NNN.document_id;
			Объект.Статус=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОтправленЧерновик");
				//НСтр=Объект.Товары.НайтиПоИдентификатору(СформироватьФайлДляОтправки_3.Идентификатор);
//				Объект._Order_ID=NNN.orderId;
			
	ИначеЕсли Ответ.КодСостояния=401 		ИЛИ Ответ.КодСостояния=502    Тогда
	Иначе
		//	Если УжеОтправили=Истина Тогда
				Объект.Статус=ПредопределенноеЗначение("Перечисление.СтатусыДокументов_ХамелеонЦРПТ.Отказ");
					Попытка
						//ЧтениеJSON = Новый ЧтениеJSON;
						//ЧтениеJSON.УстановитьСтроку(Текст1);
						NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Текст1);//ПрочитатьJSON(ЧтениеJSON);
						попытка
							
							Объект.ОшибкаОтправки=NNN.error_message;
						Исключение
							Попытка
								Объект.ОшибкаОтправки=NNN.error_description;
								Если NNN.error="access_denied" Тогда
									Сообщить(NNN.error_description+" "+" сайт ЦРПТ не доступен. Повторите отправку позже");
								КонецЕсли;
							Исключение
								Сообщить(Текст1);
							КонецПопытки;
							
						КонецПопытки;
						
					Исключение
					КонецПопытки;
		//	Иначе
		//		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1,ЭтаФорма,"ПодписатьФайлПослеПолученияТокена");
		//		ОтправитьЗаявку(Команда,Истина)			
		//	КонецЕсли
	КонецЕсли;

		Если 	ЗаписыватьДанныеПриОтправкеЗаказа тогда
			ЗапишемВРегистр_Ответ(Текст1);
		КонецЕсли;
			
		
		
	ЭтаФорма.Записать();
	
КонецПроцедуры

Процедура ЗапишемВРегистр_Ответ(ТекстДокумент)
	РегДв=РегистрыСведений.ОтправленныеПолученные_ХамелеонЦРПТ.СоздатьНаборЗаписей();
	РегДв.Отбор.Документ.Установить(Объект.Ссылка);
	РегДв.Отбор.Вид.Установить("Получили ответ");
	Добав=РегДв.Добавить();
	Добав.Документ=ОБъект.Ссылка;
	Добав.Вид="Получили ответ";
	Добав.Файл=Новый ХранилищеЗначения(ТекстДокумент,Новый СжатиеДанных(9));
	РегДв.Записать(Истина);
КонецПроцедуры

Функция ВернутьУНИКУМ()
	Возврат xmlString(Новый УникальныйИдентификатор())
КонецФункции

Функция ПолучитьИзПользователя()
	//Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Объект.ТекущийПользователь);
	Струк=Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Объект.ТекущийПользователь);
	
	Струк.Вставить("РасчетОстатков",РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().РасчетОстатков);
	
	Возврат Струк;
КонецФункции


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
		ЗаписыватьДанныеПриОтправкеЗаказа=РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().ЗаписыватьДанныеПриОтправкеЗаказа;

КонецПроцедуры

