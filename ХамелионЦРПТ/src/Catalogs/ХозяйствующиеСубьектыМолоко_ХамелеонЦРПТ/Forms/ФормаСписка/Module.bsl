&НаКлиенте
Функция ПодключилисьОк(Thumbprint_1,CSRFДляНК,Срегистра,КукиДляНК,HTTPСервисЗапрос,СерийныйНомер)
	
	Возврат ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодключилисьОк(Thumbprint_1,CSRFДляНК,Срегистра,КукиДляНК,HTTPСервисЗапрос,СерийныйНомер)	
КонецФункции

&НаСервереБезКонтекста
Функция ПолучитьИзПользователя(ТекущийПользователь)
	Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(ТекущийПользователь);
КонецФункции

&НаСервереБезКонтекста
Процедура ОчиститьТокенСрегистра(ТТ)
	ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаписатьТокенВРегистр(ТТ,"")
КонецПроцедуры


&НаКлиенте
Процедура НайтиХС(Команда)
	// Вставить содержимое обработчика.
	СчетчикУникальности=1;
	Форм=ОткрытьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.ВводСтроки",,,СчетчикУникальности,,,Новый ОПисаниеОповещения("ПричинаАннулирования",ЭтаФорма),РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);
	Форм.Заголовок="Укажите либо ИНН, либо GUID хозяйствущего субъекта в реестре РСХН";
	//Форм.Заголовок="Аннулирование транзакций";
	Форм.Строка="";
	
КонецПроцедуры

&НаКлиенте
Процедура ПричинаАннулирования(РР,ДД) Экспорт
	

	если Не ЗначениеЗАполнено(РР) Тогда
		ЭтаФорма.Закрыть();
		Возврат;
	Конецесли;
	ПолучитьВсеХС(РР)
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьВсеХС(РР,УжеОтправили=Ложь)
	Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Если НЕ Форм.Открыта() Тогда
		Форм.Открыть(); 
	КонецЕсли;
	
	Thumbprint_1=ПолучитьИзПользователя(Форм.Пользователь);
	
	Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
			Прокси=Новый ИнтернетПрокси;
			Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
			
			
		//	HTTPСервисЗапрос=Новый HTTPСоединение("account.integrators.nk.crpt.tech",,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
		//	HTTPСервисЗапрос=Новый HTTPСоединение("xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai",,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
			HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.КаталогСайт,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
		Иначе
		///	HTTPСервисЗапрос=Новый HTTPСоединение("account.integrators.nk.crpt.tech",,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
			//HTTPСервисЗапрос=Новый HTTPСоединение("xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai",,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
			HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.КаталогСайт,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
		КонецЕсли;
		
	
	
	
	crsfToken="";
	Срегистра="";
	Куки="";
		СерийныйНомер="";
	Если ПодключилисьОк(Thumbprint_1,crsfToken,Срегистра,Куки,HTTPСервисЗапрос,СерийныйНомер) Тогда
	   
		Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
			Прокси=Новый ИнтернетПрокси;
			Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
			
			
		//	HTTPСервисЗапрос=Новый HTTPСоединение("account.integrators.nk.crpt.tech",,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
		//	HTTPСервисЗапрос=Новый HTTPСоединение("xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai",,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
			HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.КаталогСайт,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
		Иначе
		///	HTTPСервисЗапрос=Новый HTTPСоединение("account.integrators.nk.crpt.tech",,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
			//HTTPСервисЗапрос=Новый HTTPСоединение("xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai",,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
			HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.КаталогСайт,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
		КонецЕсли;
		

					
			//Тело=ИщемПоГТИН(РР);
				
				
				
				HTTPЗапрос=Новый HTTPЗапрос("rest/dictionaries/vetis/entity?catId=230988&q="+РР);
				
		HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
			HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
								
						
			//	5HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
			//HTTPЗапрос.Заголовки.Вставить("Accept-Encoding","gzip, deflate, br");
			HTTPЗапрос.Заголовки.Вставить("Accept-Language","ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Credentials", "true");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Headers", "Origin, X-Requested-With, Cont…cept, Credentials, Set-Cookie");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Methods", "*");
			
			HTTPЗапрос.Заголовки.Вставить("Cache-Control", "private, max-age=0, no-cache, no-store");
			HTTPЗапрос.Заголовки.Вставить("Connection","keep-alive");
	//		HTTPЗапрос.Заголовки.Вставить("Sec-Fetch-Dest","empty");
	//		HTTPЗапрос.Заголовки.Вставить("Sec-Fetch-Mode", "cors");
			//HTTPЗапрос.Заголовки.Вставить("Content-Length",Формат(СтрДлина(Тело),"ЧГ="));
				//HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json; charset=utf-8");
	//		HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
			
			HTTPЗапрос.Заголовки.Вставить("Host", Thumbprint_1.КаталогСайт);
		//	//"xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai");
		//	HTTPЗапрос.Заголовки.Вставить("Origin", "https://"+Thumbprint_1.КаталогСайт);
		//	HTTPЗапрос.Заголовки.Вставить("Referer", "https://"+Thumbprint_1.КаталогСайт+"/product?type=unit");
			HTTPЗапрос.Заголовки.Вставить("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0");
		
//	HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
			
			HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				Ответ=HTTPСервисЗапрос.Получить(HTTPЗапрос);
				NNN=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				data=Неопределено;
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено 
					ИЛИ ТипЗнч(NNN)<>Тип("Массив")
					Тогда
					ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1);
					Если УжеОтправили<>Истина Тогда
						ПолучитьВсеХС(РР,Истина);
						Возврат;
					Иначе
						Сообщить("Не удалось обновить карточку из НК (КТМ)");
						Возврат;
					КонецЕсли;
					
				КонецЕсли;
				
				СоздатьХСНаСервере(NNN);
				
					
			ИначеЕсли УжеОтправили=Ложь Тогда
				
			    	ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1);
					Если УжеОтправили<>Истина Тогда
						ПолучитьВсеХС(РР,Истина);
						Возврат;
					Иначе
						Сообщить("Не удалось обновить карточку из НК (КТМ)");
						Возврат;
					КонецЕсли;
				
			КонецЕсли;
			Попытка
				ЭтаФорма.ВладелецФормы.Список.Обновить();
			Исключение
			КонецПопытки;
//			ЭтаФорма.Закрыть();
Элементы.Список.Обновить();

	
КонецПроцедуры
		
Процедура  СоздатьХСНаСервере(NNN)
	Для каждого Стр Из NNN Цикл
		
		СпрХС=Справочники.ХозяйствующиеСубьектыМолоко_ХамелеонЦРПТ.НайтиПоКоду(стр.id);
		Если ЗначениеЗаполнено(СпрХС) тогда
			СпрХС=СпрХС.ПолучитьОбъект()
		Иначе
			СпрХС=Справочники.ХозяйствующиеСубьектыМолоко_ХамелеонЦРПТ.СоздатьЭлемент();
			СпрХС.Код=стр.id;
		Конецесли;
		СпрХС.Наименование=Стр.text;
		СпрХС.ИНН=Стр.secondId;
		СпрХС.Записать();;
		
		
		
	Конеццикла;
КонецПроцедуры

