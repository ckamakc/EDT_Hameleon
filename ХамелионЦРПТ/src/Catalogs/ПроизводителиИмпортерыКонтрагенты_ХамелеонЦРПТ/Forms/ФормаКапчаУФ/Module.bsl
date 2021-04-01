

&НаКлиенте
Перем Request;
&НаКлиенте
Перем СaptchaToken;

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Реквизит1="1. Нет необходимости вводить капчу(слово с картинки)
		|2. Возможность группового обновления нескольких контрагентов одновременно, т. е. для целой группы/списка контрагентов можно по клику мышки запросить актуальные данные и автоматически их обновить
		|3. Возможность доработки под Вашу конфигурацию с гарантией 1 месяц(пункт доработка+ключ)
		|4. Отсутствие всплывающих окон с рекламой";
	ДляПроверки="Проверка сохр";
	МассивИНН=Параметры.МассивКлиентов;
	
	МассивИНН_1.Очистить();
	Для Каждого Стр Из МассивИНН Цикл
		МассивИНН_1.Добавить(Стр);
		
		
	Конеццикла;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика.
	Если МассивИНН_1.Количество()>0 Тогда
		ИНН=МассивИНН_1[0];
	Иначе
		Отказ=Истина;
		//ЭтаФорма.Закрыть(Неопределено);
		Возврат;
	КонецЕсли;
	ПодключитьОбработчикОжидания("аа_Капч",0.1,Истина);
КонецПроцедуры

&НаКлиенте
Процедура аа_Капч() Экспорт
	ОобновитьКапчу();
	
КонецПроцедуры

Процедура ОбновитьКапчуНаСервере()
	РеквизитФормыВзначение("Объект").ОбновитьКапп();
КонецПроцедуры


&наСервереБезКонтекста
Процедура ДобавитьПараметр(Тело, ИмяПарам, ЗначПарам) Экспорт
	Тело = Тело + "&" + ИмяПарам + "=" + КодироватьСтроку(ЗначПарам, СпособКодированияСтроки.КодировкаURL);
КонецПроцедуры

&наКлиенте
Процедура ПолучаемНовуКапчу()
	
		Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
		Открыть=не ФОрм.Открыта();
		Если Открыть Тогда
			Форм.Открыть();
		КонецЕсли;
		Thumbprint_1=Форм.ПолучитьИзПользователя();	
	 	 
	
		Request.Open("GET", "https://egrul.nalog.ru/captcha-dialog.html?aver=1.5.3&sver=4.29.8&pageStyle=CUSTOM", 0);
		
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
		
		Request.SetRequestHeader("Accept", "application/json, text/javascript, */*; q=0.01");
		Request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   		Request.Send();
		Request.WaitForResponse();	
			НайтиРисунок=Сред(Request.ResponseText,Найти(Request.ResponseText,"img src")+9);
			НайтиРисунок=Сред(НайтиРисунок,1,Найти(НайтиРисунок,"""")-1);
			СaptchaToken=Сред(НайтиРисунок,Найти(НайтиРисунок,"?a=")+3);
			СaptchaToken=Сред(СaptchaToken,1,Найти(СaptchaToken,"&")-1);
			
			Request.Open("GET", "https://egrul.nalog.ru"+НайтиРисунок, 0);
			
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
			
		Request.SetRequestHeader("Accept", "image/webp,image/*,*/*;q=0.8");
		Request.Send();
		Request.WaitForResponse();
		
		
			TempFile = TempFilesDir() + "Captcha.png"; //GetTempFileName("png");
		Stream = New COMObject("ADODB.Stream");
		Stream.Mode = 3;
		Stream.Type = 1;
		Stream.Open();
		Stream.Write(Request.ResponseBody);	
		Попытка
			Stream.SaveToFile(TempFile, 2);
		Исключение
		КонецПопытки;
		Stream.Close();
	
		АдресКапчи = PutToTempStorage(New Picture(TempFile, True));
		
	
КонецПроцедуры
&наКлиенте
Процедура ОобновитьКапчу()
	
Попытка	
	//ОбновитьКапчуНаСервере();
	
	
	//Возврат;
	Request="";	
	Request = New COMObject("WinHttp.WinHttpRequest.5.1");
	
//	Если ПервыйЗапрос=ложь Тогда
		
		
		ОтправитьПервыйЗапрос(ИНН,"");
	Исключение
	КонецПопытки
КонецПроцедуры
	
&НаКлиенте
Процедура ОтправитьПервыйЗапрос(ИНН,vyp3CaptchaToken)
		Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
		Открыть=не ФОрм.Открыта();
		Если Открыть Тогда
			Форм.Открыть();
			Попытка
				ЭтаФорма.ВладелецФормы.Активизировать()
			Исключение
			КонецПопытки;
		КонецЕсли;
		
		Thumbprint_1=Форм.ПолучитьИзПользователя();	
	Тело = "";
	
	Address = "https://egrul.nalog.ru";
	
	ДобавитьПараметр(Тело, "PreventChromeAutocomplete","");
	ДобавитьПараметр(Тело, "query", ИНН);
	ДобавитьПараметр(Тело, "region", "");
	ДобавитьПараметр(Тело, "vyp3CaptchaToken", vyp3CaptchaToken);
	Тело = Сред(Тело,2);
	
			Request.Open("POST", Address, 0);
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
			
		Request.SetRequestHeader("Accept", "application/json, text/javascript, */*; q=0.01");
		Request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   		Request.Send(Тело);
		Request.WaitForResponse();	
		//JSONReader = New JSONReader;
		//JSONReader.SetString(Request.ResponseText);
		Result = ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Request.ResponseText);
		Ошибка="";
		Если Result.Свойство("ERRORS",Ошибка) Тогда
			///КАПЧА
			ПолучаемНовуКапчу();
			Возврат;
		Конецесли;
		
			Вых=Истина;
			еееее=Result.t;
			Пока Вых Цикл
				
				HTTPСоединение=Новый HTTPСоединение("egrul.nalog.ru",,,,,,Новый ЗащищенноеСоединениеOpenSSL());
				Запрос=Новый HTTPЗапрос("search-result/"+еееее);
				Ответ=HTTPСоединение.Получить(Запрос);
				Отв=Ответ.ПолучитьТелоКакСтроку(КодировкаТекста.UTF8);
				
//			Request.Open("GET", "https://egrul.nalog.ru/search-result/"+еееее, 0);
//		Request.SetRequestHeader("Accept", "*/*");
//		Request.SetRequestHeader("Accept-Encoding", "gzip,deflate, br");
//		Request.SetRequestHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0");
				
//		Request.SetRequestHeader("Connection",	"keep-alive");


//		Request.SetRequestHeader("Accept-Language","ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3");
//		Request.SetRequestHeader("X-Requested-With", "XMLHttpRequest");
		//Request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
//		JSONReader = New JSONReader;
		//JSONReader.SetString(Отв);
		//Result = ReadJSON(JSONReader);
		Result = ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Отв);
		Свойств=Result.Свойство("status");
		Если  НЕ Свойств ИЛИ (Свойств И Result.status<>"wait") Тогда
			Прервать;
		КонецЕсли;
	Конеццикла;
	
	Если Result.rows.Количество()=0 ТОгда
		        Сообщить("По данному ИНН "+ИНН+" не нашли данных в Едином реестре");
				
				МассивИНН_1.Удалить(0);
				Если МассивИНН_1.Количество()=0 Тогда
					ЗакрытьМодульнуюФорму=Истина;			
					Этаформа.Закрыть(МассивУдачных);
				Иначе
					ИНН=МассивИНН_1.Получить(0);
					ОобновитьКапчу();
					ПодключитьобработчикОжидания("аа",0.1,Истина);
				КонецЕсли;

				
				
				//ЗакрытьМодульнуюФорму=Истина;			
				//Этаформа.Закрыть(МассивУдачных);

		Возврат;
	Конецесли;
	
	
	Структ=Result.rows[Result.rows.Количество()-1];
	МассивУдачных.Добавить(Новый Структура("ИНН,Дв",ИНН,Структ));
	
	МассивИНН_1.Удалить(0);
	Если МассивИНН_1.Количество()=0 Тогда
		ЗакрытьМодульнуюФорму=Истина;			
		Этаформа.Закрыть(МассивУдачных);
	Иначе
		ИНН=МассивИНН_1.Получить(0);
		ОобновитьКапчу();
		ПодключитьобработчикОжидания("аа",0.1,Истина);
	КонецЕсли;

	
	//ЭтаФорма.Закрыть(МассивУдачных);
	//ФайлЗапис=Новый ;
	
	Возврат;
	
			Request.Open("GET", "https://egrul.nalog.ru/vyp-request/"+Result.rows[Result.rows.Количество()-1].t, 0);
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
			
			Request.SetRequestHeader("Accept", "*/*");
			
		Request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
   
			Request.Send();
			Request.WaitForResponse();
			
		//JSONReader = New JSONReader;
		//JSONReader.SetString(Request.ResponseText);
		//Result = ReadJSON(JSONReader);
		Result = ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Request.ResponseText);
		
		
		
		
		Если Result.Property("ERRORS") Тогда
			ПервыйЗапрос=Истина;
			RT=Result.ERRORS.t[0];
			ПолучаемНовуКапчу();
			ПодключитьобработчикОжидания("аа",0.1,Истина);
			
		Иначе
			ОпределяемКонтрагента(Result.t);
			
		КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОпределяемКонтрагента(ttt)
		Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
		Открыть=не ФОрм.Открыта();
		Если Открыть Тогда
			Форм.Открыть();
		КонецЕсли;
		Thumbprint_1=Форм.ПолучитьИзПользователя();	
		
		Вых=Истина;
		Пока Вых Цикл
			Request.Open("GET", "https://egrul.nalog.ru/vyp-status/"+ttt, 0);
			
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
			
			Request.SetRequestHeader("Accept", "*/*");
			Request.Send();
			Request.WaitForResponse();
			
		//JSONReader = New JSONReader;
		//JSONReader.SetString(Request.ResponseText);
		//Result_1 = ReadJSON(JSONReader);
		Result_1  = ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Request.ResponseText);
		Если  Result_1.status<>"wait" Тогда
			Прервать;
		КонецЕсли;
	Конеццикла;
			Request.Open("GET", "https://egrul.nalog.ru/search-result/"+ttt, 0);
			
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
			
			Request.SetRequestHeader("Accept", "*/*");
			
			Request.Send();
			Request.WaitForResponse();
	
	
	Возврат;
			Request.Open("GET", "https://egrul.nalog.ru/vyp-download/"+ttt, 0);
			
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
			
			Request.SetRequestHeader("Accept", "text/html, application/xhtml+xml, image/jxr, */*");
			
			Request.Send();
			Request.WaitForResponse();
			
			СоздатьКаталогАвтоКонтр();
			
			TempFile=TempFilesDir()+"AvtoKontragentHameleon\"+ИНН+".pdf";
			
			Stream = New COMObject("ADODB.Stream");
			Stream.Mode = 3;
			Stream.Type = 1;
			Stream.Open();
			Stream.Write(Request.ResponseBody);	
			Попытка
				Stream.SaveToFile(TempFile, 2);
			Исключение
			КонецПопытки;
			Stream.Close();
			ДвоичныеДанные=Новый ДвоичныеДанные(TempFile);


			МассивУдачных.Добавить(Новый Структура("ИНН,Дв",ИНН,ДвоичныеДанные));
				МассивИНН_1.Удалить(0);
			Если МассивИНН_1.Количество()=0 Тогда
				ЗакрытьМодульнуюФорму=Истина;			
				Этаформа.Закрыть(МассивУдачных);
			Иначе
				ИНН=МассивИНН_1.Получить(0);
				ОобновитьКапчу();
				ПодключитьобработчикОжидания("аа",0.1,Истина);
			КонецЕсли;

	
КонецПроцедуры


Процедура СоздатьКаталогАвтоКонтр()
	ФайлНовый=Новый Файл(TempFilesDir()+"AvtoKontragentHameleon\");
	Если НЕ ФайлНовый.Существует() Тогда
		СоздатьКаталог(TempFilesDir()+"AvtoKontragentHameleon\");
	КонецЕсли;
	
КонецПроцедуры


&НаКлиенте
Процедура Команда2(Команда)
	// Вставить содержимое обработчика.
	ОобновитьКапчу();
КонецПроцедуры

Процедура ПрочитатьИнфуНаСервере()
	
	РеквизитФормыВзначение("Объект").ПрочитатьИнфуНасервере(ИНН,ТекстСЗапросом);
	
		ТекстСЗапросом="";
	ЭтаФорма.ТекущийЭлемент=Элементы.Поле2;

	
КонецПроцедуры

&НаКлиенте
Процедура Команда1(Команда)
	// Вставить содержимое обработчика.
		Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
		Открыть=не ФОрм.Открыта();
		Если Открыть Тогда
			Форм.Открыть();
		КонецЕсли;
		Thumbprint_1=Форм.ПолучитьИзПользователя();	
	
	
//	ПрочитатьИнфуНаСервере();
//	Возврат;
	
	Address = "https://egrul.nalog.ru/captcha-proc.json";
		//kind = ?(StrLen(ИНН) = 10, "ul", "fl");
	
		RequestText = "";
		RequestText = RequestText + "captcha=" + ТекстСЗапросом + "&";
		RequestText = RequestText + "captchaToken=" + СaptchaToken;
		
	ТекстСЗапросом="";
	ЭтаФорма.ТекущийЭлемент=Элементы.Поле2;
		
		
		Request.Open("POST", Address, 0);
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
		
		Request.SetRequestHeader("Accept", "application/json, text/javascript, */*; q=0.01");
		Request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		Request.Send(RequestText);
		Request.WaitForResponse();
		
		
//////Надо обработать на сервере
		///ОбработкаPDFНаСервере(Request.ResponseText);
			//JSONReader = New JSONReader;
			//JSONReader.SetString(Request.ResponseText);
			//Result = ReadJSON(JSONReader);
			Result = ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Request.ResponseText);
		
			Если ТипЗнч(Result)<>Тип("Структура") Тогда
				
				Если ПервыйЗапрос ТОгда
					
					
					Request.Open("GET", "https://egrul.nalog.ru/vyp-request/"+RT+"?r="+СтрЗаменить(Request.ResponseText,"""",""), 0);
		 Если ЗначениеЗаполнено(Thumbprint_1.АдресПрокси) Тогда
			Request.SetProxy(2, Thumbprint_1.АдресПрокси+":"+Thumbprint_1.ПортПрокси);
		КонецЕслИ;
		Если ЗначениеЗАполнено(Thumbprint_1.ПользовательПрокси) Тогда
		   	Request.SetCredentials(Thumbprint_1.ПользовательПрокси, Thumbprint_1.ПарольПрокси, 1);
		КонецЕсли;
					
					Request.SetRequestHeader("Accept", "application/json, text/javascript, */*; q=0.01");
					Request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					Request.Send();
					Request.WaitForResponse();
				//JSONReader = New JSONReader;
					//JSONReader.SetString(Request.ResponseText);
					//Result = ReadJSON(JSONReader);
			Result = ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ЗаполнитьСтруктуруИзОтветаJSON(Request.ResponseText);
					
					ОпределяемКонтрагента(СтрЗаменить(Result.t,"""",""))
					
					
				Иначе
		                                                                          
					ОтправитьПервыйЗапрос(ИНН,СтрЗаменить(Request.ResponseText,"""",""))		
				КонецЕсли;
			
		Иначе
			
			              
			If Result.Property("ERRORS") Then
				Если Result.ERRORS.Property("captcha") Тогда
				ПоказатьПредупреждение(,"Ошибка получения данных! Введите еще раз текст с картинки");
				ПолучаемНовуКапчу();
					ПодключитьобработчикОжидания("аа",0.1,Истина);
				
				Возврат;
			Иначе
				ПоказатьПредупреждение(Новый ОписаниеОповещения("ЗакрытьФорму",ЭтаФорма),"Ошибка получения данных! Не правильные данные");
				      Возврат

	КонецЕсли
			EndIf;
		    Конецесли;
	//	If Result.rows.Count() = 0 Then
	//		Message("Контрагент с указанным ИНН "+ИНН+" не найден");
	//		
	//		МассивУдачных.Добавить(ИНН);
	//		
	//		МассивИНН_1.Удалить(0);
	//		Если МассивИНН_1.Количество()=0 Тогда
	//			Этаформа.Закрыть(МассивУдачных);
	//		Иначе
	//			ИНН=МассивИНН_1.Получить(0);
	//			ОобновитьКапчу();
	//		КонецЕсли;
	//		Возврат;
	//	EndIf;
	//	ОкончаласьРегистрацияКлиента=Ложь;
	//	For each Contractor In Result.rows Do
	//		ЕНД="";
	//		Если Contractor.Свойство("DTEND",ЕНД) Тогда
	//			ОкончаласьРегистрацияКлиента=Истина;
	//		Иначе
	//			ОкончаласьРегистрацияКлиента=Ложь;
	//			
	//		Конецесли;
	//		//RefContr = НайтиКонтрагента(Contractor.INN, ?(Contractor.Property("KPP"), Contractor.KPP, ""));
	//		//If RefContr <> Undefined Then
	//		//	Message("Контрагент с такими ИНН и КПП уже существует в базе");
	//		//	Return RefContr;
	//		//EndIf;
	//		
	//		Request.Open("GET", Address + "/download/" + Contractor.T, 0);
	//		Request.SetRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
	//		Request.Send();
	//		Request.WaitForResponse();
	//		
	//		СоздатьКаталогАвтоКонтр();
	//		
	//		TempFile=TempFilesDir()+"AvtoKontragentHameleon\"+ИНН+".pdf";
	//		
	//		Stream = New COMObject("ADODB.Stream");
	//		Stream.Mode = 3;
	//		Stream.Type = 1;
	//		Stream.Open();
	//		Stream.Write(Request.ResponseBody);	
	//		Попытка
	//			Stream.SaveToFile(TempFile, 2);
	//		Исключение
	//		КонецПопытки;
	//		Stream.Close();
	//		ДвоичныеДанные=Новый ДвоичныеДанные(TempFile);
	//		Если не ОкончаласьРегистрацияКлиента Тогда
	//			Прервать
	//		КонецЕслИ
	//		//ПрочитатьДанныеФайла(TempFile, Contractor.INN);
	//		//ПрочитатьДанныеФайла(ДвоичныеДанные, Contractor.INN);
	//	//	Прервать;
	//		
	//	EndDo;
	//	Если ОкончаласьРегистрацияКлиента=Истина Тогда
	//		ВызватьИсключение "Дата прекращения деятельности организации "+ЕНД+" считывание данных невозможно";
	//		
	//	КонецЕсли;


	//МассивУдачных.Добавить(Новый Структура("ИНН,Дв",ИНН,ДвоичныеДанные));
	//			МассивИНН_1.Удалить(0);
	//		Если МассивИНН_1.Количество()=0 Тогда
	//			ЗакрытьМодульнуюФорму=Истина;			
	//			Этаформа.Закрыть(МассивУдачных);
	//		Иначе
	//			ИНН=МассивИНН_1.Получить(0);
	//			ОобновитьКапчу();
	//			ПодключитьобработчикОжидания("аа",0.1,Истина);
	//		КонецЕсли;

	//
	
		КонецПроцедуры
		
		
&НаКлиенте
		Процедура ЗакрытьФорму(РР) Экспорт
						МассивУдачных=Новый Массив         ;
				Этаформа.Закрыть(МассивУдачных);
КонецПроцедуры
&НаКлиенте
Процедура аа()  Экспорт
	ЭтаФорма.ТекущийЭлемент=Элементы.Поле2;
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии()
	// Вставить содержимое обработчика.
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	
	 Если НЕ ЗакрытьМодульнуюФорму Тогда
        СтандартнаяОбработка = Ложь;
        ЗакрытьМодульнуюФорму = Истина;
        ЭтаФорма.Закрыть(МассивУдачных);
    КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура Команда3(Команда)
	// Вставить содержимое обработчика.
		// Вставить содержимое обработчика.
	ЗапуститьПриложение("http://infostart.ru/public/546923/");

КонецПроцедуры

&НаКлиенте
Процедура Поле2ПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	Команда1(Элемент);
	
КонецПроцедуры


