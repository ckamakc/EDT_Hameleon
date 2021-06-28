
&НаКлиенте
Процедура СоздатьВводВОборотXMLСтандарт(Команда)
	
	Перем Файл;
	ВклЗаг = 0;
	//ДанныеЛиста.Очистить();
	Режим=РежимДиалогаВыбораФайла.Открытие;
	нДиалог= НОвый ДиалогВыбораФайла(Режим);
	//Фильтр="Файл xls/txt/xml|*.xls;*.xlsx;*.txt;*.xml|Файл txt|*.txt|Файл xls|*.xls;*.xlsx|Файл xml|*.xml";
	Фильтр="Файл xml|*.xml";
	нДиалог.МножественныйВыбор=Истина;
	нДиалог.Фильтр=Фильтр;
	нДиалог.Заголовок="Выберите файл для загрузки..." ;
	нДиалог.Показать(Новый ОписаниеОповещения("ПослеВыбораФайла_ВводВОБОРОТ_ХамелеонЦРПТСтандарт",ЭтаФорма,Ложь));
	
		

КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораФайла_ВводВОБОРОТ_ХамелеонЦРПТСтандарт(РР,ДД) Экспорт
	МассивАгрегация=Новый Массив;
	МассивАгрегация.Очистить();
	Если РР<>Неопределено тогда
		Для Каждого Стр_Ф Из РР Цикл
			
			ДвоичнДанные=Новый ДвоичныеДанные(Стр_Ф);
			создатьАгрегацииПоФайлуСтандарт(ДвоичнДанные,МассивАгрегация);
			
		Конеццикла;
		
		Если дД=Истина Тогда
			
			Для Каждого Стр_1 Из МассивАгрегация Цикл
				Форм=ПолучитьФорму("Документ.ВводВОборот_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
				"Ключ",Стр_1));
				Форм.ОтправитьЗаявку(ДД);
				
			Конеццикла;
			
		КонецЕслИ;
		Элементы.Список.Обновить();
	КонецЕсли;
	
КонецПроцедуры

Процедура создатьАгрегацииПоФайлуСтандарт(ДвоичнДанные,МассивАгрегация)
	
	ОбщийМодуль_НаСервере_ХамелеонЦРПТ.СоздатьВводВОборотПоФайлуСтандарт(ДвоичнДанные,МассивАгрегация);

КонецПроцедуры

&НаКлиенте
Процедура СоздатьВводВОборотJSON(Команда)
		// Вставить содержимое обработчика.

	Перем Файл;
	ВклЗаг = 0;
	//ДанныеЛиста.Очистить();
	Режим=РежимДиалогаВыбораФайла.Открытие;
	нДиалог= НОвый ДиалогВыбораФайла(Режим);
	//Фильтр="Файл xls/txt/xml|*.xls;*.xlsx;*.txt;*.xml|Файл txt|*.txt|Файл xls|*.xls;*.xlsx|Файл xml|*.xml";
	Фильтр="Файл json|*.json";
	нДиалог.МножественныйВыбор=Истина;
	нДиалог.Фильтр=Фильтр;
	нДиалог.Заголовок="Выберите файл для загрузки..." ;
	нДиалог.Показать(Новый ОписаниеОповещения("ПослеВыбораФайла_ВводВОБОРОТ_ХамелеонЦРПТJSON",ЭтаФорма,Ложь));
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораФайла_ВводВОБОРОТ_ХамелеонЦРПТJSON(РР,ДД) Экспорт
	МассивАгрегация=Новый Массив;
	МассивАгрегация.Очистить();
	Если РР<>Неопределено тогда
		Для Каждого Стр_Ф Из РР Цикл
			ВыбФайл = Новый Файл(Стр_Ф);
			ИмяФайла = ВыбФайл.Имя;
			ДвоичнДанные=Новый ДвоичныеДанные(Стр_Ф);
			СтруктураПараметров = Новый Структура("ИмяФайла",ИмяФайла );
			СоздатьАгрегацииПоФайлуJSON(ДвоичнДанные,МассивАгрегация,СтруктураПараметров);
			
		Конеццикла;
		
		Если дД=Истина Тогда
			
			Для Каждого Стр_1 Из МассивАгрегация Цикл
				Форм=ПолучитьФорму("Документ.ВводВОборот_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
				"Ключ",Стр_1));
				Форм.ОтправитьЗаявку(ДД);
				
			Конеццикла;
			
		КонецЕслИ;
		Элементы.Список.Обновить();
	КонецЕсли;
	
КонецПроцедуры
Процедура СоздатьАгрегацииПоФайлуJSON(ДвоичнДанные,МассивАгрегация,СтруктураПараметров)
	
	Пользователь=ХранилищеСистемныхНастроек.Загрузить("ТекущийПользователь_ХамелеонЦРПТ","ТекущийПользователь_ХамелеонЦРПТ");
	СтруктураПараметров.Вставить("Пользователь",Пользователь);
	Если ЗначениеЗаполнено(Пользователь) И типЗнч(Пользователь)=Тип("СправочникСсылка.Пользователи_ХамелеонЦРПТ") тогда
		МВ_ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗагрузитьВводВоборотJSON(ДвоичнДанные,МассивАгрегация,СтруктураПараметров);
	Иначе
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю("Ошибка. Пользователь не определен");
	КонецЕсли;
	
		
КонецПроцедуры


&НаКлиенте
Процедура СоздатьОтчетОНанесенииXML(Команда)
		// Вставить содержимое обработчика.
		
	Перем Файл;
	ВклЗаг = 0;
	//ДанныеЛиста.Очистить();
	Режим=РежимДиалогаВыбораФайла.Открытие;
	нДиалог= НОвый ДиалогВыбораФайла(Режим);
	//Фильтр="Файл xls/txt/xml|*.xls;*.xlsx;*.txt;*.xml|Файл txt|*.txt|Файл xls|*.xls;*.xlsx|Файл xml|*.xml";
	Фильтр="Файл xml|*.xml";
	нДиалог.МножественныйВыбор=Истина;
	нДиалог.Фильтр=Фильтр;
	нДиалог.Заголовок="Выберите файл для загрузки..." ;
	нДиалог.Показать(Новый ОписаниеОповещения("ПослеВыбораФайла_ОтчетНанесения_ХамелеонЦРПТ",ЭтаФорма,Ложь));
	
	

КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораФайла_ОтчетНанесения_ХамелеонЦРПТ(РР,ДД) Экспорт
	МассивАгрегация=Новый Массив;
	МассивАгрегация.Очистить();
	Если РР<>Неопределено тогда
		Для Каждого Стр_Ф Из РР Цикл
			
			ДвоичнДанные=Новый ДвоичныеДанные(Стр_Ф);
			СоздатьОтчетОНанесении(ДвоичнДанные,МассивАгрегация);
			
			
			
		Конеццикла;
		
		Если дД=Истина Тогда
			
			Для Каждого Стр_1 Из МассивАгрегация Цикл
				Форм=ПолучитьФорму("Документ.ВводВОборот_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
				"Ключ",Стр_1));
				Форм.ОтправитьЗаявку(ДД);
				
			Конеццикла;
			
		КонецЕслИ;
		Элементы.Список.Обновить();
	КонецЕсли;
	
	
	
КонецПроцедуры

Процедура СоздатьОтчетОНанесении(ДвоичнДанные,МассивАгрегация)
	
	
//	ОбщийМодуль_НаСервере_ХамелеонЦРПТ.СоздатьОтчетОНанесении(ДвоичнДанные,МассивАгрегация);
	МВ_ОбщийМодуль_НаСервере_ХамелеонЦРПТ.СоздатьВводВОборотПоФайлуСтандарт(ДвоичнДанные,МассивАгрегация);

КонецПроцедуры


&НаСервереБезКонтекста
Функция СписокПриАктивизацииСтрокиНаСервере(ССылка)
	GTIN = "";
	Если ЗначениеЗаполнено(ССылка) Тогда
		Если ССылка.ТОвары.Количество()= 1 Тогда 
			GTIN = Формат(ССылка.Товары[0].GTIN.GTIN,"ЧГ=0");
			//GTIN = СтрЗаменить(СокрЛП(GTINСтрока),Символ("160"),"")
		КонецЕсли;	
	КонецЕсли;	// Вставить содержимое обработчика.
	Возврат GTIN;
КонецФункции


&НаКлиенте
Процедура СписокПриАктивизацииСтроки(Элемент)
	СписокПриАктивизацииСтрокиНаСервере(Элемент.ТекущаяСтрока);
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьСтатусыВыделенныхСтрокВвод(Команда)
	// Вставить содержимое обработчика.
	
	МассивВ=Новый Массив;
	Для Каждого СТр_11 Из Элементы.СписокВвода.ВыделенныеСтроки Цикл
		   МассивВ.Добавить(СТр_11);
	Конеццикла;
	Если МассивВ.Количество()>0 Тогда
		Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма",);
		Форм.ОбновитьСтатусыДокументов(Команда,,,МассивВ);
	КонецЕсли;
	Элементы.СписокВвода.Обновить();
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьВЦРПТВводВОборот(Команда)
	// Вставить содержимое обработчика.
	Для Каждого Стр Из Элементы.СписокВвода.ВыделенныеСтроки Цикл
		Форм=ПолучитьФорму("Документ.ВводВОборот_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
		"Ключ",Стр));
		Форм.ОтправитьЗаявку(Команда);
	КонецциклА;
	Элементы.СписокВвода.Обновить();

КонецПроцедуры

&НаКлиенте
Процедура СоздатьНаОснвоании(Команда)
	МассивОтчетаОНанесении=Новый Массив;
	Для Каждого СтрокаСписка Из Элементы.СписокВвода.ВыделенныеСтроки Цикл		
		//ПараметрыФормы = Новый Структура("ЗначениеЗаполнения ", СтрокаСписка);
		//ОткрытьФорму("Документ.ВводВОборот_ХамелеонЦРПТ.Форма.ФормаДокумента", ПараметрыФормы);
		НовыйДокСсылка = СоздатьНаОснвоанииНаСервере(СтрокаСписка);
		Если  НовыйДокСсылка <> Неопределено Тогда
			//Отрыть форму документа
			//	ОткрытьЗначение(НовыйДокСсылка);
		КонецЕсли;
	Конеццикла;
	Элементы.СписокВвода.Обновить();

	
КонецПроцедуры

&НаСервере
Функция  СоздатьНаОснвоанииНаСервере(ОтчетОбИспользованииСсылка)
ДатаДокумента = ТекущаяДатаСеанса();

	Если  ОтчетОбИспользованииСсылка.ТипДокумента = ПредопределенноеЗначение("Перечисление.ТипыДокументаВводВОборот_ХамелеонЦРПТ.ОтчетОбИспользовании") Тогда
		ДокументОбъект = Документы.ВводВОборот_ХамелеонЦРПТ.СоздатьДокумент();
		ДокументОбъект = ОтчетОбИспользованииСсылка.Скопировать();
		ДокументОбъект.ДокОснование = ОтчетОбИспользованииСсылка;
		ДокументОбъект.Дата = ДатаДокумента;
		ДокументОбъект.Комментарий = "Создано на основаниии " + ОтчетОбИспользованииСсылка;
		ДокументОбъект.Записать();
		Возврат ДокументОбъект.Ссылка;
		//ДокументОбъект.ПолучитьФорму("ФормаДокумента",ДокументОбъект).Открыть();
	КонецЕсли;
	Возврат Неопределено;
КонецФункции;




