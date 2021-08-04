
&НаКлиенте
Процедура ОбработкаАктивизации(АктивныйОбъект, Источник)
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика.
	ПодключитьОбработчикОжидания("ааа",1,Истина);
	Если СокрЛП(Объект.Наименование)=СокрЛП(Объект.ИНН) Тогда
		ЗаполнитьПоИНН(Отказ);
	КонецЕсли;
КонецПроцедуры


&НаКлиенте
Процедура ЗаполнитьПоИНН(Команда)
	// Вставить содержимое обработчика.
	// Вставить содержимое обработчика.
	Если ЗначениеЗаполнено(Объект.ИНН) Тогда
		Масс1=Новый Массив;
		Масс1.Добавить(Объект.ИНН);
		ОткрытьФорму("Справочник.ПроизводителиИмпортерыКонтрагенты_ХамелеонЦРПТ.Форма.ФормаКапчаУФ",Новый Структура("МассивКлиентов",Масс1),,,,,Новый ОписаниеОповещения("ВыбратьДвоичн",ЭтаФорма));
		//ПрочитатьДанныеФайла(ДвоичныеДанные, Contractor.INN);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьДвоичн(ВыбранноеЗначение_1, ИсточникВыбора) Экспорт
 	// Вставить содержимое обработчика.
	Если ЗначениеЗаполнено(ВыбранноеЗначение_1) Тогда
		Если ВыбранноеЗначение_1.Количество()=0 Тогда
			Возврат;
		КонецЕсли;
	         ВыбранноеЗначение=ВыбранноеЗначение_1[0].Значение.Дв;
		Если ВыбранноеЗначение.Свойство("n",Объект.Наименование) Тогда
		
		
			ВыбранноеЗначение.Свойство("n",Объект.Наименование);
			Если СтрДлина(СокрЛП(Объект.ИНН))=12 Тогда
				Объект.Наименование="ИП "+Объект.Наименование;
				
				//Объект.НаименованиеПолное="ИП "+Объект.НаименованиеПолное;
			КонецЕсли;
		КонецЕсли;
		//Заполним адреса
		ВыбранноеЗначение.Свойство("p",Объект.КПП);
		
		ВыбранноеЗначение.Свойство("a",Объект.АдресМестонахождения);
		
			//ВыбранноеЗначение.Свойство("o",Объект.ОГРН);
		
		
		//Объект.ИНН						= ВыбранноеЗначение.i;
	
		Если Объект.ИНН<>Объект.Наименование Тогда
			ЭтаФорма.Записать();
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры


&НаКлиенте
Процедура ааа() 
	Если ТекущийЭлемент=Элементы.АдресДляОткрытия Тогда
		
		
		Форм=ОткрытьФорму("РегистрСведений.Адрес_ХамелеонЦРПТ.Форма.ФормаЗаписи",Новый Структура("ЗначенияЗаполнения",Новый Структура("Объект,Тип",Объект.Ссылка,
		ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Юричический"))));
		Форм.Запись.Тип=ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Юричический");
	ИначеЕсли ТекущийЭлемент=Элементы.АдресФакт Тогда
		
		Форм=ОткрытьФорму("РегистрСведений.Адрес_ХамелеонЦРПТ.Форма.ФормаЗаписи",Новый Структура("ЗначенияЗаполнения",Новый Структура("Объект,Тип",Объект.Ссылка,
		ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Фактический"))));
		Форм.Запись.Тип=ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Фактический");
		
		
	Конецесли;
	Элементы.АдресДляОткрытия.Видимость=Ложь;
	Элементы.АдресФакт.Видимость=Ложь;
	
КонецПроцедуры

&НаСервере
Процедура ОчиститьПриемкуНаСервере()
	// Вставить содержимое обработчика.
	Если ЗначениеЗАполнено(Объект.Ссылка) тогда
		Регдв=РегистрыСведений.ПриемкаПоОрганизациям_ХамелеонЦРПТ.СоздатьНаборЗаписей();
		Регдв.Отбор.Организация.Установить(Объект.Ссылка);
		РегДв.Записать(Истина);
	КонецЕслИ;
	
КонецПроцедуры

&НаКлиенте
Процедура ОчиститьПриемку(Команда)
	ОчиститьПриемкуНаСервере();
КонецПроцедуры

Процедура ПроверкаПользователь(Пользоватлеь)
	
	Если Пользоватлеь.Организация<>Объект.Ссылка Тогда
		
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
			|	Пользователи_ХамелеонЦРПТ.Организация = &Организация
			|	И НЕ Пользователи_ХамелеонЦРПТ.ПометкаУдаления";
		
		Запрос.УстановитьПараметр("Организация", Объект.Ссылка);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			// Вставить обработку выборки ВыборкаДетальныеЗаписи
			Пользователь=ВыборкаДетальныеЗаписи.Ссылка;
			Возврат;
		КонецЦикла;
		
		//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

		
	КонецЕсли;
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьИзПользователя(ТекущийПользователь)
	Возврат Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(ТекущийПользователь);
КонецФункции


&НаКлиенте
Процедура ОбновитьТаблицуСубаккаунтов(Команда,УжеОтправили=ЛОжь)
	// Вставить содержимое обработчика.
	Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Если НЕ Форм.Открыта() Тогда
		Форм.Открыть(); 
	КонецЕсли;
	
	Пользоватлеь=Форм.Пользователь;
	ПроверкаПользователь(Пользоватлеь);
	
	Thumbprint_1=ПолучитьИзПользователя(Пользоватлеь);
 	
	
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
	Объект.Субаккаунты.Очистить();
	Если ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодключилисьОк(Thumbprint_1,crsfToken,Срегистра,Куки,HTTPСервисЗапрос)	 Тогда
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
		
		
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts?page=1&size=10");
				HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
				HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
							
				HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
						
				HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
						
				HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
				Ответ=HTTPСервисЗапрос.Получить(HTTPЗапрос);
				
				Тотал=1000;
				Смещение=1;
				Пока Смещение*10<Тотал Цикл
					
					NNN=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
					data=Неопределено;
					Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено 
						ИЛИ НЕ  NNN.Свойство("data",data)
						Тогда
						ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1);
						Если УжеОтправили<>Истина Тогда
							ОбновитьТаблицуСубаккаунтов(Команда,Истина);
							//ОбновитьКарточкуИзНК(Команда,Истина);
							Возврат;
						Иначе
							Сообщить("Не удалось обновить карточку из НК (КТМ)");
							Возврат;
						КонецЕсли;
						
					КонецЕсли;
					
					Тотал=ЗагрузитьСубака(NNN);
					
					
					Смещение=Смещение+1;
					
					HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts?page="+Формат(Смещение,"ЧГ=")+"&size=10");
					HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
					HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
								
					HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
							
					HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
					
							
					HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
					Ответ=HTTPСервисЗапрос.Получить(HTTPЗапрос);
					
					
					
				Конеццикла;
				
				Объект.ОбработаноВЦРПТ=Истина;
				
	Конецесли;

	
КонецПроцедуры

Функция ЗагрузитьСубака(NNN)
	
	Для каждого Стр_1 Из NNN.data Цикл
		Добав=Объект.Субаккаунты.Добавить();
		Добав.Разрешить=Стр_1.accessAllowed;
		Добав.ОтправленоВЦРПТ=Истина;
		Добав.Контрагент=Справочники.ПроизводителиИмпортерыКонтрагенты_ХамелеонЦРПТ.НайтиПоРеквизиту("ИНН",Стр_1.inn);
		Если Не ЗначениеЗаполнено(добав.Контрагент) Тогда
			СпрПр=Справочники.ПроизводителиИмпортерыКонтрагенты_ХамелеонЦРПТ.СоздатьЭлемент();
			СпрПр.ИНН=Стр_1.inn;
			СпрПр.Наименование=Стр_1.name;
			СпрПр.Записать();
			Добав.Контрагент=СпрПр.Ссылка;
		КонецЕсли;
		Добав.ИНН=Добав.Контрагент.ИНН;
		Добав.ИД=Стр_1.id;
		
	Конеццикла;
	
	
	Возврат NNN.totalObjects
Конецфункции

&НаСервереБезКонтекста
Процедура ОчиститьТокенСрегистра(ТТ)
	ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаписатьТокенВРегистр(ТТ,"")
КонецПроцедуры


&НаКлиенте
Процедура ТаблицаСубаккаунтыПослеУдаления(Элемент)
	// Вставить содержимое обработчика.
	Объект.ОбработаноВЦРПТ=ЛожЬ;
КонецПроцедуры


&НаКлиенте
Процедура Таблица1РазрешитьПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	Элементы.ТаблицаСубаккаунты.ТекущиеДанные.ОтправленоВЦРПТ=Ложь;
КонецПроцедуры


&НаКлиенте
Процедура ТаблицаСубаккаунтыПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	// Вставить содержимое обработчика.
	Объект.ОбработаноВЦРПТ=Ложь;
КонецПроцедуры

Функция ВернутьИНН(К)
	Возврат К.ИНН;
	
Конецфункции

&НаКлиенте
Процедура ОтправитьВЦРПТ_1(Команда,УжеОтправили=Ложь)
	// Вставить содержимое обработчика.
	
	ПоказатьВопрос(Новый ОписаниеОповещения("ПослеВопросаСубаккаунт",ЭтаФорма),"Вы уверены, что хотите разрешить возможность заказывать КМ для указанных организаций?",
	РежимДиалогаВопрос.ДаНет);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВопросаСубаккаунт(РР,ДД) Экспорт
	
	Если РР<>КодВозвратаДиалога.Да тогда
		Возврат;
	КонецЕсли;
	ОтправитьВЦРПТ("");
КонецПроцедуры


&НаКлиенте
Процедура ОтправитьВЦРПТ(Команда,УжеОтправили=Ложь)
	Если УжеОтправили=Истина Тогда
		ЗарузитьСтарыеДанные();
		
	КонецЕсли;
	
	СохранитьСтарыеДанные();
	
	ОбновитьТаблицуСубаккаунтов(Команда);
	Объект.ОбработаноВЦРПТ=Ложь;
	Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Если НЕ Форм.Открыта() Тогда
		Форм.Открыть(); 
	КонецЕсли;
	
	Пользоватлеь=Форм.Пользователь;
	ПроверкаПользователь(Пользоватлеь);
	
	Thumbprint_1=ПолучитьИзПользователя(Пользоватлеь);
 	
	
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
	Если ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодключилисьОк(Thumbprint_1,crsfToken,Срегистра,Куки,HTTPСервисЗапрос)	 Тогда
				
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
		
			
		Для Каждого Стр_1 Из СубаккаунтСохранить Цикл
			
			ИНН=ВернутьИНН(Стр_1.Контрагент);
			Стр_1.ИНН=ИНН;
			Стр_1.ОтправленоВЦРПТ=Ложь;
			Нстр=Объект.Субаккаунты.НайтиСтроки(Новый Структура("ИНН",ИНН));
			Если НСтр.Количество()=0 Тогда
				
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-account/validate-inn");
				HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
				HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
							
				HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
						
				HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
						
				HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
				
				ИНН="";
				ТелоПоИНН=ТелоПоИНН_ССервер(Стр_1.Контрагент,ИНН);
				HTTPЗапрос.Заголовки.Вставить("Content-Length",Формат(СтрДлина(ТелоПоИНН),"ЧГ="));
				//HTTPЗапрос.УстановитьТелоИзСтроки(ТелоПоИНН);
				#Если ВебКлиент Тогда
					HTTPЗапрос.УстановитьТелоИзСтроки(ТелоПоИНН,КодировкаТекста.UTF8);
				#Иначе
					HTTPЗапрос.УстановитьТелоИзСтроки(ТелоПоИНН,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				#КонецЕсли
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				NNN=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				name="";
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено ИЛИ NNN.Свойство("name",name)<>Истина Тогда
					
						ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1);
						Если УжеОтправили<>Истина Тогда
							ОтправитьВЦРПТ(Команда,Истина);
							//ОбновитьКарточкуИзНК(Команда,Истина);
							Возврат;
						Иначе
							
							Попытка
								Для Каждого Стр_2 Из NNN.errors Цикл
									Сообщить("ИНН "+Стр_1.ИНН+" наименование "+Строка(Стр_1.Контрагент)+": "+Стр_2);
								Конеццикла;
							Исключение
							КонецПопытки;
							//Сообщить();
							Продолжить;
						КонецЕсли;
					
				КонецЕсли;
				
				Boundary = СтрЗаменить(Строка(Новый УникальныйИдентификатор()), "-", "");
				Тело="--" + Boundary+"
				|Content-Disposition: form-data; name=""inns[]""
				|
				|"+ИНН+"
				|--" + Boundary+"
				|Content-Disposition: form-data; name=""names[]""
				|
				|"+name+"
				|--" + Boundary+"--
				|";
				
				
				
				//Двоичныеданные=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(Тело,КодировкаТекста.UTF8,ЛОжь);
				Двоичныеданные=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьДвоичныеДанныеИзСтроки_Сервер(Тело,КодировкаТекста.UTF8,ЛОжь);
				
				
				РазмерФайла=Двоичныеданные.Размер();

				
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-account");
			HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
			//HTTPЗапрос.Заголовки.Вставить("Accept-Encoding","gzip, deflate");
			HTTPЗапрос.Заголовки.Вставить("Accept-Language","ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Credentials", "true");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Headers", "Origin, X-Requested-With, Cont…cept, Credentials, Set-Cookie");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Methods", "*");
			
			HTTPЗапрос.Заголовки.Вставить("Cache-Control", "private, max-age=0, no-cache, no-store");
			HTTPЗапрос.Заголовки.Вставить("Connection","keep-alive");
			
			HTTPЗапрос.Заголовки.Вставить("Content-Length",Формат(РазмерФайла,"ЧГ="));
							
			HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
			
			HTTPЗапрос.Заголовки.Вставить("Host", Thumbprint_1.КаталогСайт);
			//"xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai");
			HTTPЗапрос.Заголовки.Вставить("Origin", "https://"+Thumbprint_1.КаталогСайт);
			HTTPЗапрос.Заголовки.Вставить("Referer", "https://"+Thumbprint_1.КаталогСайт+"/profile");
				HTTPЗапрос.Заголовки.Вставить("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0");
			HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
						

				HTTPЗапрос.Заголовки.Вставить("Content-Type","multipart/form-data; boundary="+Boundary);
				
				HTTPЗапрос.УстановитьТелоИзДвоичныхДанных(Двоичныеданные);
			//	#Если ВебКлиент Тогда
			//		HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8);
			//	#Иначе
			///		HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				//#КонецЕсли
				
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				NNN=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				
				Если Ответ.КодСостояния<>200 Тогда
					Продолжить;
				КонецЕсли;
				                            
				ОбновитьТаблицуСубаккаунтов(Команда);
				Объект.ОбработаноВЦРПТ=Ложь;
				Нстр=Объект.Субаккаунты.НайтиСтроки(Новый Структура("ИНН",ИНН));
				Если НСтр.Количество()=0 Тогда
					Продолжить;
				КонецЕсли;
				
			КонецЕсли;
			Если НСтр[0].Разрешить=Стр_1.Разрешить Тогда
				Стр_1.ОтправленоВЦРПТ=Истина;
			Иначе
				ДоступК=Стр_1.Разрешить;
				
				
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts/xml");
			HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
			//HTTPЗапрос.Заголовки.Вставить("Accept-Encoding","gzip, deflate");
			HTTPЗапрос.Заголовки.Вставить("Accept-Language","ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Credentials", "true");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Headers", "Origin, X-Requested-With, Cont…cept, Credentials, Set-Cookie");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Methods", "*");
			
			HTTPЗапрос.Заголовки.Вставить("Cache-Control", "private, max-age=0, no-cache, no-store");
			HTTPЗапрос.Заголовки.Вставить("Connection","keep-alive");
	//		HTTPЗапрос.Заголовки.Вставить("Sec-Fetch-Dest","empty");
	//		HTTPЗапрос.Заголовки.Вставить("Sec-Fetch-Mode", "cors");
			HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
			HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
			
			HTTPЗапрос.Заголовки.Вставить("Host", Thumbprint_1.КаталогСайт);
			//"xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai");
			HTTPЗапрос.Заголовки.Вставить("Origin", "https://"+Thumbprint_1.КаталогСайт);
		HTTPЗапрос.Заголовки.Вставить("Referer", "https://"+Thumbprint_1.КаталогСайт+"/profile");
			HTTPЗапрос.Заголовки.Вставить("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0");
			HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
				//ИНН="";
				РазрешитьТело=РазрешаемЛибо(НСтр[0].ИД,ДоступК);
				HTTPЗапрос.Заголовки.Вставить("Content-Length",Формат(СтрДлина(РазрешитьТело),"ЧГ="));
				//HTTPЗапрос.УстановитьТелоИзСтроки(РазрешитьТело);
				#Если ВебКлиент Тогда
					HTTPЗапрос.УстановитьТелоИзСтроки(РазрешитьТело,КодировкаТекста.UTF8);
				#Иначе
					HTTPЗапрос.УстановитьТелоИзСтроки(РазрешитьТело,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				#КонецЕсли
				
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				
				NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				
				xml="";
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено ИЛИ ТипЗнч(NNN)<>Тип("Массив") Тогда
					
						ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1);
						Если УжеОтправили<>Истина Тогда
							ОтправитьВЦРПТ(Команда,Истина);
							//ОбновитьКарточкуИзНК(Команда,Истина);
							Возврат;
						Иначе
							Продолжить;
						КонецЕсли;
					
				КонецЕсли;
				
				
				
				xmlДляПодписи=NNN[0].xml;					
				Имя_вр_1="";
				ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайлXML(xmlДляПодписи,Thumbprint_1.Thumbprint_1,Имя_вр_1);						
				Имя_вр_1=СтрЗаменить(Имя_вр_1,символы.ПС,"");				
				Имя_вр_1=СтрЗаменить(Имя_вр_1,символы.ВК,"");				
				
				
				Тело=ПодписанныйJSON(Имя_вр_1,НСтр[0].ИД);
				
				 	
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts/sign");
				HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
				HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
							
				HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
						
				HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
						
				HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
				
				//HTTPЗапрос.УстановитьТелоИзСтроки(Тело);
				#Если ВебКлиент Тогда
					HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8);
				#Иначе
					HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				#КонецЕсли
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				
				NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено Тогда
						Продолжить;
					
				КонецЕсли;
				
				 ОбновитьТаблицуСубаккаунтов(Команда);
	Объект.ОбработаноВЦРПТ=Ложь;
				Нстр=Объект.Субаккаунты.НайтиСтроки(Новый Структура("ИНН",ИНН));
				Если НСтр.Количество()=0 Тогда
					Продолжить;
				ИначеЕсли НСтр[0].Разрешить=Стр_1.Разрешить Тогда
					Стр_1.ОтправленоВЦРПТ=Истина;
				КонецЕсли;
			

				
				
				
				
				
			Конецесли;
			
			
		Конеццикла;
		
	КонецЕсли;
	////УДАЛИТЬ
	НормУдалить=Истина;
	
	Для Каждого Стр_1 Из Объект.Субаккаунты Цикл
		
		Если СубаккаунтСохранить.НайтиСтроки(Новый Структура("ИНН",Стр_1.ИНН)).Количество()=0 Тогда
			Если Стр_1.Разрешить=Истина Тогда
				
				
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts/xml");
			HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
			//HTTPЗапрос.Заголовки.Вставить("Accept-Encoding","gzip, deflate");
			HTTPЗапрос.Заголовки.Вставить("Accept-Language","ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Credentials", "true");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Headers", "Origin, X-Requested-With, Cont…cept, Credentials, Set-Cookie");
			HTTPЗапрос.Заголовки.Вставить("Access-Control-Allow-Methods", "*");
			
			HTTPЗапрос.Заголовки.Вставить("Cache-Control", "private, max-age=0, no-cache, no-store");
			HTTPЗапрос.Заголовки.Вставить("Connection","keep-alive");
	//		HTTPЗапрос.Заголовки.Вставить("Sec-Fetch-Dest","empty");
	//		HTTPЗапрос.Заголовки.Вставить("Sec-Fetch-Mode", "cors");
			HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
			HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
			
			HTTPЗапрос.Заголовки.Вставить("Host", Thumbprint_1.КаталогСайт);
			//"xn--j1ab.xn----7sbabas4ajkhfocclk9d3cvfsa.xn--p1ai");
			HTTPЗапрос.Заголовки.Вставить("Origin", "https://"+Thumbprint_1.КаталогСайт);
		HTTPЗапрос.Заголовки.Вставить("Referer", "https://"+Thumbprint_1.КаталогСайт+"/profile");
			HTTPЗапрос.Заголовки.Вставить("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0");
			HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
				//ИНН="";
				РазрешитьТело=РазрешаемЛибо(Стр_1.ИД,Ложь);
				HTTPЗапрос.Заголовки.Вставить("Content-Length",Формат(СтрДлина(РазрешитьТело),"ЧГ="));
				//HTTPЗапрос.УстановитьТелоИзСтроки(РазрешитьТело);
				#Если ВебКлиент Тогда
					HTTPЗапрос.УстановитьТелоИзСтроки(РазрешитьТело,КодировкаТекста.UTF8);
				#Иначе
					HTTPЗапрос.УстановитьТелоИзСтроки(РазрешитьТело,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				#КонецЕсли
				
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				
				NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				
				xml="";
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено ИЛИ ТипЗнч(NNN)<>Тип("Массив") Тогда
					
						ОчиститьТокенСрегистра(Thumbprint_1.Thumbprint_1);
						Если УжеОтправили<>Истина Тогда
							ОтправитьВЦРПТ(Команда,Истина);
							//ОбновитьКарточкуИзНК(Команда,Истина);
							Возврат;
						Иначе
							Сообщить("Не удалось удалить строчку с ИНН "+Стр_1.ИНН );
							НормУдалить=Ложь;
							Продолжить;
						КонецЕсли;
					
				КонецЕсли;
				
				
				
				xmlДляПодписи=NNN[0].xml;					
				Имя_вр_1="";
				ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодписатьФайлXML(xmlДляПодписи,Thumbprint_1.Thumbprint_1,Имя_вр_1);						
				Имя_вр_1=СтрЗаменить(Имя_вр_1,символы.ПС,"");				
				Имя_вр_1=СтрЗаменить(Имя_вр_1,символы.ВК,"");				
				
				
				Тело=ПодписанныйJSON(Имя_вр_1,Стр_1.ИД);
				
				 	
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts/sign");
				HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
				HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
							
				HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
						
				HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
						
				HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
				
				//HTTPЗапрос.УстановитьТелоИзСтроки(Тело);
				#Если ВебКлиент Тогда
					HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8);
				#Иначе
					HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				#КонецЕсли
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				
				NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено Тогда
					НормУдалить=Ложь;
						Сообщить("Не удалось удалить строчку с ИНН "+Стр_1.ИНН );
						
						Продолжить;
					
				КонецЕсли;
			Конецесли;
				
				 Тело=УдалитьИд(Стр_1.ИД);
				
				 	
				HTTPЗапрос=Новый HTTPЗапрос("rest/accounts/linked-accounts/delete");
				HTTPЗапрос.Заголовки.Вставить("Accept","application/json, text/plain, */*");
				HTTPЗапрос.Заголовки.Вставить("Cookie",Куки);
							
				HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+Срегистра);
						
				HTTPЗапрос.Заголовки.Вставить("X-Csrf-Token",crsfToken);
				
						
				HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
				
				//HTTPЗапрос.УстановитьТелоИзСтроки(Тело);
				#Если ВебКлиент Тогда
					HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8);
				#Иначе
					HTTPЗапрос.УстановитьТелоИзСтроки(Тело,КодировкаТекста.UTF8,ИспользованиеByteOrderMark.НеИспользовать);
				#КонецЕсли
				
				Ответ=HTTPСервисЗапрос.ОтправитьДляОбработки(HTTPЗапрос);
				
				
				NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Ответ.ПолучитьТелоКакСтроку());
				
				Если Ответ.КодСостояния<>200 ИЛИ NNN=Неопределено Тогда
					НормУдалить=Ложь;
						Сообщить("Не удалось удалить строчку с ИНН "+Стр_1.ИНН );
						
						Продолжить;
					
				КонецЕсли;
				

				 
				
				
			
		КонецЕсли;
			
		
	Конеццикла;
	
	
		 ОбновитьТаблицуСубаккаунтов(Команда);
	Объект.ОбработаноВЦРПТ=Ложь;
			
Для Каждого Стр_1 Из Объект.Субаккаунты Цикл
		
		Если СубаккаунтСохранить.НайтиСтроки(Новый Структура("ИНН",Стр_1.ИНН)).Количество()=0 Тогда
			
				НормУдалить=Ложь;
				Сообщить("Не удалось удалить строчку с ИНН "+Стр_1.ИНН );
				
		КонецЕсли;
			
		
	Конеццикла;
	
	
	ЗарузитьСтарыеДанные();
	Если НормУдалить=Ложь Тогда
		Возврат;
	КонецЕсли;
	Для Каждого Стр_1 Из Объект.Субаккаунты Цикл
		
		Если Стр_1.ОтправленоВЦРПТ=Ложь Тогда
			Возврат;
		КонецЕсли;
	Конеццикла;
	Объект.ОбработаноВЦРПТ=Истина;
	
КонецПроцедуры

Функция УдалитьИд(ИД)
	Джсон=Новый ЗаписьJSON;
	Джсон.УстановитьСтроку(Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет,,,ЭкранированиеСимволовJSON.СимволыВнеASCII));
	
	Джсон.ЗаписатьНачалоОбъекта();;
	Джсон.ЗаписатьИмяСвойства("ids");
	Джсон.ЗаписатьНачалоМассива();
	Джсон.ЗаписатьЗначение(Ид);
	Джсон.ЗаписатьКонецМассива();
	
	Джсон.ЗаписатьКонецОбъекта();
	
	
	Тело=Джсон.Закрыть();
	Возврат тело
	
	
Конецфункции

&НаСервереБезКонтекста
Функция ПодписанныйJSON(Имя_вр_1,Ид)
	
	Джсон=Новый ЗаписьJSON;
	Джсон.УстановитьСтроку(Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет,,,ЭкранированиеСимволовJSON.СимволыВнеASCII));
	Джсон.ЗаписатьНачалоМассива();
	
	Джсон.ЗаписатьНачалоОбъекта();;
	Джсон.ЗаписатьИмяСвойства("xml");
	Джсон.ЗаписатьЗначение(Имя_вр_1);
	Джсон.ЗаписатьИмяСвойства("accountId");
	Джсон.ЗаписатьЗначение(Ид);
	
	Джсон.ЗаписатьКонецОбъекта();
	Джсон.ЗаписатьКонецМассива();
	
	
	Тело=Джсон.Закрыть();
	Возврат тело
	
	
Конецфункции



&НаСервереБезКонтекста
Функция РазрешаемЛибо(ИД,Разрешить)
			Джсон=Новый ЗаписьJson;
				Джсон.УстановитьСтроку(Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет,,,ЭкранированиеСимволовJSON.СимволыВнеASCII));
				Джсон.ЗаписатьНачалоМассива();
				Джсон.ЗаписатьНачалоОбъекта();
				
				Джсон.ЗаписатьИмяСвойства("accountId");
				Джсон.ЗаписатьЗначение(ИД);
				
				Джсон.ЗаписатьИмяСвойства("isAccessAllowed");
				Джсон.ЗаписатьЗначение(Разрешить);
				Джсон.ЗаписатьКонецОбъекта();;
				Джсон.ЗаписатьКонецМассива();
				Тело=Джсон.Закрыть();
				Возврат тело
	
Конецфункции

&НаСервереБезКонтекста
Функция ТелоПоИНН_ССервер(Контр,ИНН)
			Джсон=Новый ЗаписьJson;
				Джсон.УстановитьСтроку(Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет,,,ЭкранированиеСимволовJSON.СимволыВнеASCII));
				Джсон.ЗаписатьНачалоОбъекта();
				
				Джсон.ЗаписатьИмяСвойства("inn");
				Джсон.ЗаписатьЗначение(Контр.ИНН);
				
				Джсон.ЗаписатьКонецОбъекта();;
				Тело=Джсон.Закрыть();
				
				ИНН=Контр.Инн;
				Возврат тело
	
	
Конецфункции

Процедура ЗарузитьСтарыеДанные()
	
	ТаблицаЗн=СубаккаунтСохранить.Выгрузить();
	Объект.Субаккаунты.Загрузить(ТаблицаЗН);
	
Конецпроцедуры


Процедура СохранитьСтарыеДанные()
	ТаблицаЗн=Объект.Субаккаунты.Выгрузить();
	СубаккаунтСохранить.Загрузить(ТаблицаЗН);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьИДТХЦ(Команда)
	// Вставить содержимое обработчика.
	Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Если НЕ Форм.Открыта() Тогда
		Форм.Открыть(); 
	КонецЕсли;
	
	Пользоватлеь=Форм.Пользователь;
	ПроверкаПользователь(Пользоватлеь);
	
	
	Thumbprint_1=ПолучитьИзПользователя(Пользоватлеь);
	
	СайтДляПодключенияПоТакскму=Thumbprint_1.ТХЦ;
	Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
		Прокси=Новый ИнтернетПрокси;
		Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
				
		HTTPСервисЗапрос_ТХЦ=Новый HTTPСоединение(СайтДляПодключенияПоТакскму,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
	Иначе
				
		HTTPСервисЗапрос_ТХЦ=Новый HTTPСоединение(СайтДляПодключенияПоТакскму,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
	КонецЕсли;

	Маркер=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПодключитьсяКЭДОТХЦ(Thumbprint_1,"",HTTPСервисЗапрос_ТХЦ);
	Если  ЗначениеЗаполнено(Маркер) тогда
		ИдЭДО=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ПолучитьИДЭДО(Thumbprint_1,Маркер,HTTPСервисЗапрос_ТХЦ);
		Если Значениезаполнено(ИдЭДО.ИНН) И ИдЭДО.ИНН=Объект.ИНН Тогда
			Объект.ИД_ЭДО=ИдЭДО.Идентификатор
		КонецЕсли;
	Иначе
		Сообщить("Не удалось определить ИД ЭДО ТХЦ");
	КонецЕсли;
	
		
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьИдЭДОЛайт(Команда)
	// Вставить содержимое обработчика.
	Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Если НЕ Форм.Открыта() Тогда
		Форм.Открыть(); 
	КонецЕсли;
	
	Пользоватлеь=Форм.Пользователь;
	ПроверкаПользователь(Пользоватлеь);
	
	Thumbprint_1=ПолучитьИзПользователя(Пользоватлеь);
	СтруктураНастроек=Неопределено;                                                    
	СерийныйНомер="";
	СРегистра=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПолучитьТокенСрегистра(Thumbprint_1.Thumbprint_1,СтруктураНастроек);
			СерийныйНомер=СтруктураНастроек.СерийныйНомер;
	
		Если Не ЗначениеЗаполнено(СРегистра) ИЛИ Не ЗначениеЗаполнено(СерийныйНомер) Тогда
			СРегистра=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1,СерийныйНомер);	
		Иначе
		   
				Если ЗначениеЗАполнено(Thumbprint_1.АдресПрокси) Тогда
					Прокси=Новый ИнтернетПрокси;
					Прокси.Установить("http",Thumbprint_1.АдресПрокси,Thumbprint_1.ПортПрокси,Thumbprint_1.ПользовательПрокси,Thumbprint_1.ПарольПрокси);
				
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресДляПолученияТокена,,,,Прокси,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				Иначе
				
					HTTPСервисЗапрос=Новый HTTPСоединение(Thumbprint_1.АдресДляПолученияТокена,,,,,Thumbprint_1.Таймаут,Новый ЗащищенноеСоединениеopenSSL());
				КонецЕсли;
				
				HTTPЗапрос=Новый HTTPЗапрос("api/v3/facade/balance/all");
				HTTPЗапрос.Заголовки.Вставить("Content-Type","application/json;charset=UTF-8");
				HTTPЗапрос.Заголовки.Вставить("Authorization","Bearer "+СРегистра);
				//HTTPЗапрос.Заголовки.Вставить("Host","ismotp.crptech.ru");
				///Константин           
				Ответ=HTTPСервисЗапрос.ВызватьHTTPМетод("GET",HTTPЗапрос);
				//Текст1=Ответ.ПолучитьТелоКакСтроку();
				Если Ответ.КодСостояния<>200 Тогда
					СРегистра=ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.Получение_Токена(Thumbprint_1,СерийныйНомер);	
				КонецЕсли;
					
		КонецЕсли;
	
		
	Если ЗначениеЗаполнено(СРегистра) Тогда
	
		 СайтМаркирвки=Thumbprint_1.АдресДляПолученияТокена;
		 
		ЭтаФорма.Записать();
		ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ЗаписатьИДЭДОВОрганизацию(Thumbprint_1,СайтМаркирвки,Срегистра,СерийныйНомер);
		ЭтаФорма.Прочитать();
	Конецесли;
КонецПроцедуры

Функция ВыведимСообщение()
	СпрЭДО=Справочники.ЭДО_ХамелеонЦРПТ.НайтиПоРеквизиту("ИдентификаторОператораЭДО",Сред(Объект.ИД_ЭДО,1,3));
	Сообщить("Клиент подключен к "+СпрЭДО.Наименование+" идентификатор ЭДО "+Сред(Объект.ИД_ЭДО,1,3));
КонецФункции

&НаКлиенте
Процедура ВыборИДЭДО(Команда)
	// Вставить содержимое обработчика.
	// Вставить содержимое обработчика.
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Content-Type", "application/json");
	
	Соединение = Новый HTTPСоединение("edo-integration.1c.ru",,,,,, Новый ЗащищенноеСоединениеOpenSSL);
	Запрос = Новый HTTPЗапрос("api/edo-settings/identifiers/search", Заголовки);
	Запрос.УстановитьТелоИзСтроки("{""innList"": ["""+Объект.ИНН+"""],""page"": 0}");
	
	ОтветСтрока = Соединение.ОтправитьДляОбработки(Запрос).ПолучитьТелоКакСтроку();
	
	NNN=ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(ОтветСтрока);//ПрочитатьJSON(ЧтениеJSON);
	Если NNN.identifierInfos.Количество()=1 Тогда
		Объект.ИД_ЭДО=NNN.identifierInfos[0].id;
		ВыведимСообщение();
	ИначеЕсли NNN.identifierInfos.Количество()>1 Тогда
		ОткрытьФорму("Справочник.ЭДО_ХамелеонЦРПТ.Форма.ФормаВыбораЭДО",
		Новый структура("ДЖСОН",NNN),,,,,Новый ОписаниеОповещения("ПослеВыбораИД",ЭтаФорма));
		
	Иначе
		ПоказатЬПредупреждение(,"Клиент не подключен к ЭДО");
	КонецЕсли;
		
КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораИД(РР,ДД) Экспорт
	Если ЗначениеЗаполнено(РР) Тогда
		Объект.ИД_ЭДО=РР
	КонецЕсли;
КонецПроцедуры

 &НаСервереБезКонтекста
 Функция ПолучитьКлючЗаписи(Структура)
	Запись = РегистрыСведений.Адрес_ХамелеонЦРПТ.СоздатьМенеджерЗаписи();
	ЗаполнитьЗначенияСвойств(Запись,Структура);
	Запись.Прочитать();
	Если Запись.Выбран() = Ложь Тогда
	   Возврат Неопределено;
	КонецЕсли; 	 
	Возврат РегистрыСведений.Адрес_ХамелеонЦРПТ.СоздатьКлючЗаписи(Структура);
КонецФункции

&НаКлиенте
Процедура ЮрАдресВXMLНажатие(Элемент)
	// Вставить содержимое обработчика.
	// Вставить содержимое обработчика.
	КлючЗаписиРегистра = ПолучитьКлючЗаписи(Новый Структура("Объект,Тип", Объект.Ссылка,ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Юричический")));
	 Если КлючЗаписиРегистра =Неопределено тогда
		Форм=ОткрытьФорму("РегистрСведений.Адрес_ХамелеонЦРПТ.Форма.ФормаЗаписи",Новый Структура("ЗначенияЗаполнения",Новый Структура("Объект,Тип",Объект.Ссылка,
		ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Юричический"))));
		Форм.Запись.Тип=ПредопределенноеЗначение("Перечисление.ТипАдреса_ХамелеонЦРПТ.Юричический");
	Иначе
		ОткрытьФорму("РегистрСведений.Адрес_ХамелеонЦРПТ.Форма.ФормаЗаписи", Новый Структура("Ключ", КлючЗаписиРегистра)); 		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ГрузополучательОтличаетсяПриИзменении(Элемент)
		// Вставить содержимое обработчика.
	Сообщить("Для отображения в документе поля грузоотправитель и грузополучатель, переоткройте документ");

КонецПроцедуры

&НаКлиенте
Процедура СУЗПоНовомуДинамическийТокенПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	Если Объект.СУЗПоНовомуДинамическийТокен=Истина Тогда
		Сообщить("Для каждого пользователя ХамелеонЦРПТ по данной организации нажмите кнопку: ПОЛУЧЕНИЕ ТОКЕН И ИД");
	Конецесли
КонецПроцедуры
