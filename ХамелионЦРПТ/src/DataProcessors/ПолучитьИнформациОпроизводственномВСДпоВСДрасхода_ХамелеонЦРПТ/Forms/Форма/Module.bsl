
&НаКлиенте
Процедура Поле1ПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	///c5941489-00e0-4c4c-b7ba-fb201ee36911
	ИнформацияОВСД.Очистить();
	ПолучитьСтруктуруПВСД(Реквизит1)
КонецПроцедуры

Функция ПолучитьСтруктуруПВСД(UUID_ТВСД) Экспорт
УИД=UUID_ТВСД;


Если Не ЗначениеЗаполнено(УИД) Тогда
	Возврат ""
Конецесли;

				
		Сайт="mercury.vetrf.ru";
				

	Соединение = Новый HTTPСоединение(Сайт, , , , ,60, Новый ЗащищенноеСоединениеOpenSSL);   
	//Обработки._Запуск_ХамелеонМеркурий.УстановитьПрокси(Соединение,Истина);
	
	
	Запр=Новый HTTPЗапрос("pub/operatorui?_action=findVetDocumentFormByUuid&uuid="+УИД);
	//Запр.УстановитьТелоИзСтроки(ЗапросТекст,КодировкаТекста.UTF8);
//	Соединение.Send(ЗапрЙосТекст);
	//Возврат   Соединение;
	Результат = Соединение.ОтправитьДляОбработки(Запр);
	
				
	//НомерВ=Сред(Результат.ПолучитьТелоКакСтроку(),Найти(Результат.ПолучитьТелоКакСтроку(),"Номер ВСД</div><div class=""profile-info-value""><span class="""">")+62);
				ПолучСтр_1=Результат.ПолучитьТелоКакСтроку();
				
				
			//КонецЕсли;
	Чтение=Новый ЧтениеHTML;
	Чтение.УстановитьСтроку(ПолучСтр_1);
	ПостроительDOM = Новый ПостроительDOM;
	ДокументHTML = ПостроительDOM.Прочитать(Чтение);
			
	
	
	Для Каждого Стр_1 Из ДокументHTML.ПолучитьЭлементыПоИмени("a") Цикл
		Если найти(Стр_1.ТекстовоеСодержимое,"№")=1 Тогда
			СтруктураПВСД = Новый Структура;				
			Гиперссылка=Стр_1.Гиперссылка;
			Запр=Новый HTTPЗапрос("pub/"+Гиперссылка);
			Результат = Соединение.ОтправитьДляОбработки(Запр);
			ПолучСтр_1=Результат.ПолучитьТелоКакСтроку();
			
			
			
			Чтение=Новый ЧтениеHTML;
			Чтение.УстановитьСтроку(ПолучСтр_1);
			ПостроительDOM = Новый ПостроительDOM;
			ДокументHTML_1 = ПостроительDOM.Прочитать(Чтение);
			
			
			ПараметрВСД="";
			Значение="";
			
			Для Каждого Стр_П Из ДокументHTML_1.ПолучитьЭлементыПоИмени("div") Цикл
				Если Стр_П.Имякласса="profile-info-name" Тогда
					ПараметрВСД=СокрЛП(Стр_П.ТекстовоеСодержимое);
					Продолжить;
				КонецЕсли;
				Если Стр_П.Имякласса="profile-info-value" И ЗначениеЗаполнено(ПараметрВСД) Тогда
					Попытка
						СтруктураПВСД.Вставить(СтрЗаменить(ПараметрВСД," ","_"),СокрЛП(Стр_П.ТекстовоеСодержимое));
						
						Добав=ИнформацияОВСД.Добавить();
						Добав.Параметр=СтрЗаменить(ПараметрВСД," ","_");
						Добав.Значение=СокрЛП(Стр_П.ТекстовоеСодержимое)
						
					Исключение
					КонецПопытки;

					ПараметрВСД="";
					Продолжить;
				КонецЕсли;
				ПараметрВСД="";
				
				
			Конеццикла;
			Если Найти(СтруктураПВСД.Наименование_и_форма_ВСД,"Производственный сертификат")>1 Тогда
				Возврат СтруктураПВСД;
			КонецЕсли;
			
			
		КонецЕсли;
		
	Конеццикла;
				
    Возврат СтруктураПВСД
КонецФункции

