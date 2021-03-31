
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	// Вставить содержимое обработчика.
	Если не ЭтоГруппа И НЕ Остатки Тогда
			ПроверяемыеРеквизиты.Добавить("Наименование");
	КонецЕсли;
КонецПроцедуры

Процедура ПередЗаписью(Отказ)
	// Вставить содержимое обработчика.
	
	Если ЭтоГруппа=ЛОжь Тогда
		Если Не ЗначениеЗаполнено(ЭтотОбъект.СтранаПроизводства) тогда
			Польз=ХранилищеСистемныхНастроек.Загрузить("ТекущийПользователь_ХамелеонЦРПТ","ТекущийПользователь_ХамелеонЦРПТ");
			Если ЗначениеЗаполнено(Польз) И типЗнч(Польз)=Тип("СправочникСсылка.Пользователи_ХамелеонЦРПТ") тогда
				ЭтотОбъект.СтранаПроизводства=Польз.ссылка.СтранаПоУмолчанию;
				
			КонецЕслИ;
		КонецЕсли;
		//Если Не ЗначениеЗаполнено(ЭтотОБъект.Тип) Тогда
			
			////ОПРЕДЛЕЯЕМ ПО ТНВЭД
			
			Если ЗначениеЗАполнено(КодТНВЭД.Код) тогда
				Если Сред(КодТНВЭД.Код,1,2)="90" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Фото  //+++
				ИначеЕсли Сред(КодТНВЭД.Код,1,4)="8714" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Рамы
				ИначеЕсли Сред(КодТНВЭД.Код,1,2)="63" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Белье
				ИначеЕсли Сред(КодТНВЭД.Код,1,2)="40" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Шины	///++
				ИначеЕсли Сред(КодТНВЭД.Код,1,2)="42" ИЛИ Сред(КодТНВЭД.Код,1,2)="61" 
					ИЛИ Сред(КодТНВЭД.Код,1,2)="62"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Одежда
				ИначеЕсли Сред(КодТНВЭД.Код,1,4)="8711"
					ИЛИ Сред(КодТНВЭД.Код,1,4)="8712" ИЛИ 
					Сред(КодТНВЭД.Код,1,2)="95"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Велосипеды
				ИначеЕсли Сред(КодТНВЭД.Код,1,2)="64" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Обувь  ///++
				ИначеЕсли Сред(КодТНВЭД.Код,1,2)="04"
					ИЛИ Сред(КодТНВЭД.Код,1,2)="21"
					ИЛИ Сред(КодТНВЭД.Код,1,2)="22"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Молоко	///++++
				ИначеЕсли Сред(КодТНВЭД.Код,1,2)="33" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Парфюм
				ИначеЕсли Сред(КодТНВЭД.Код,1,4)="2403" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.АльтернативныйТабак
				КонецЕсли;
			ИначеЕсли ЗначениеЗаполнено(ЭтотОБъект.КодТНВЭДКороткий) Тогда
				Если Сред(КодТНВЭДКороткий,1,2)="90" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Фото
				ИначеЕсли Сред(КодТНВЭДКороткий,1,4)="8714" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Рамы
					
				ИначеЕсли Сред(КодТНВЭДКороткий,1,2)="63" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Белье
				ИначеЕсли Сред(КодТНВЭДКороткий,1,2)="40" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Шины				
					
				ИначеЕсли Сред(КодТНВЭДКороткий,1,2)="42"
					ИЛИ  Сред(КодТНВЭДКороткий,1,2)="61"
					ИЛИ  Сред(КодТНВЭДКороткий,1,2)="62"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Одежда
					
				ИначеЕсли Сред(КодТНВЭДКороткий,1,4)="8711"
					ИЛИ Сред(КодТНВЭДКороткий,1,4)="8712"
					ИЛИ Сред(КодТНВЭДКороткий,1,2)="95"
					
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Велосипеды
				ИначеЕсли Сред(КодТНВЭДКороткий,1,2)="64" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Обувь
				ИначеЕсли Сред(КодТНВЭДКороткий,1,2)="04"
					ИЛИ Сред(КодТНВЭДКороткий,1,2)="21"
					ИЛИ Сред(КодТНВЭДКороткий,1,2)="22"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Молоко
				ИначеЕсли Сред(КодТНВЭДКороткий,1,2)="33" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Парфюм
				ИначеЕсли Сред(КодТНВЭДКороткий,1,4)="2403" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.АльтернативныйТабак
				КонецЕсли;
				
			ИначеЕсли ЗначениеЗаполнено(ЭтотОБъект.ТНВЭДДляОстатка) Тогда
				Если Сред(ТНВЭДДляОстатка,1,2)="90" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Фото
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,4)="8714" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Рамы
					
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,2)="63" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Белье
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,2)="40" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Шины				
					
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,2)="42"
					ИЛИ  Сред(ТНВЭДДляОстатка,1,2)="61"
					ИЛИ  Сред(ТНВЭДДляОстатка,1,2)="62"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Одежда
					
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,4)="8711"
					ИЛИ Сред(ТНВЭДДляОстатка,1,4)="8712"
					ИЛИ Сред(ТНВЭДДляОстатка,1,2)="95"
					
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Велосипеды
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,2)="64" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Обувь
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,2)="04"
					ИЛИ Сред(ТНВЭДДляОстатка,1,2)="21"
					ИЛИ Сред(ТНВЭДДляОстатка,1,2)="22"
					Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Молоко
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,2)="33" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.Парфюм
				ИначеЕсли Сред(ТНВЭДДляОстатка,1,4)="2403" Тогда
					Тип=Перечисления.ТипПродукции_ХамелеонЦРПТ.АльтернативныйТабак
				КонецЕсли;			
			КонецЕсли;
		//КонецЕсли;
		
		
		Если Не ЗначениеЗаполненО(Наименование) И ЭтотОбъект.Остатки=Истина И (КодТНВЭДКороткий="40" 
			ИЛИ ТНВЭДДляОстатка="40" )
			И ЗначениеЗаполнено(GTIN) Тогда
			Наименование="Остатки по шинам, "+ЭтотОБъект.ДополнительныйРеквизитШины.МодельШины;
			Если ЗНачениезаполнено(ЭтотОбъект.БрендТорговаяМарка) Тогда
				Наименование=Наименование+", " +ЭтотОбъект.БрендТорговаяМарка
			Конецесли;
		Конецесли;
		
		Если Не ЗначениеЗаполненО(Наименование) И ЭтотОбъект.Остатки=Истина И (Сред(КодТНВЭДКороткий,1,2)="63" 
			ИЛИ ТНВЭДДляОстатка="63" 
			
			)
			И ЗначениеЗаполнено(GTIN) Тогда
			Наименование="Остатки по белью, "+ЭтотОБъект.Пол+", "+ЭтотОбъект.ВозрастнаяКатегория;
			Если ЗНачениезаполнено(ЭтотОбъект.БрендТорговаяМарка) Тогда
				Наименование=Наименование+", " +ЭтотОбъект.БрендТорговаяМарка
			Конецесли;
		Конецесли;
		
		Если Не ЗначениеЗаполненО(Наименование) И ЭтотОбъект.Остатки=Истина И (Сред(КодТНВЭДКороткий,1,2)="42" 
			ИЛИ ТНВЭДДляОстатка="42" 
			ИЛИ Сред(КодТНВЭДКороткий,1,2)="61" 
			ИЛИ ТНВЭДДляОстатка="61" 

			ИЛИ Сред(КодТНВЭДКороткий,1,2)="63" 
			ИЛИ ТНВЭДДляОстатка="63" 
			
			)
			И ЗначениеЗаполнено(GTIN) Тогда
			Наименование="Остатки по одежде, "+ТНВЭДДляОстатка+", "+ЭтотОБъект.Пол;
			Если ЗНачениезаполнено(ЭтотОбъект.БрендТорговаяМарка) Тогда
				Наименование=Наименование+", " +ЭтотОбъект.БрендТорговаяМарка
			Конецесли;
		Конецесли;
		
		
		Если РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().ЗаполнятьАртикулНачалоРазмерКонец Тогда
			Если Не ЗначениеЗаполнено(ЭтотОБъект.МодельПроизводителяАртикул) Тогда
				НаимТов=ЭтотОбъект.НаименованиеТовара;
				Пока Сред(НаимТов,1,1)<>" " И ЗначениеЗаполненО(НаимТов) Цикл
					МодельПроизводителяАртикул=МодельПроизводителяАртикул+Сред(НаимТов,1,1);
					НаимТов=Сред(НаимТов,2);
				Конеццикла;
			КонецЕсли;
			Если Не значениеЗаполнено(
			ЭтотОбъект.Размер) ТОгда
				НаимТов=ЭтотОбъект.НаименованиеТовара;
				Размер_1="";
				Попытка
					Пока Сред(НаимТов,СтрДлина(НаимТов),1)<>" " И ЗначениеЗаполненО(НаимТов) Цикл
						Число=Сред(НаимТов,СтрДлина(НаимТов),1);
						Размер_2=Строка(Число)+Размер_1;
						Если Число<>"," Тогда
							Число_1=Число(Размер_2);
						КонецЕсли;
						Размер_1=Строка(Число)+Размер_1;
						
						НаимТов=Сред(НаимТов,1,СтрДлина(НаимТов)-1);
					Конеццикла;
					
				Исключение
				КонецПопытки;
				Если ЗначениеЗаполнено(Размер_1) Тогда
					
					СпрР=Справочники.РазмерВШтихмассовойСистеме_ХамелеонЦРПТ.НайтиПоНаименованию(СокрЛП(РАзмер_1),Истина);
					Если не ЗначениеЗаполнено(СпрР) Тогда
						СпрР=Справочники.РазмерВШтихмассовойСистеме_ХамелеонЦРПТ.СоздатьЭлемент();
						СпрР.Наименование=СокрЛП(Размер_1);
						СпрР.Записать();
						СпрР=СпрР.Ссылка
					КонецЕсли;
					
					ЭтотОБъект.Размер =СпрР.Ссылка
				КонецЕсли;
			КонецЕслИ;
		КонецЕсли;
	КонецЕсли;
	
	МодельПроизводителяАртикул=СтрЗаменить(МодельПроизводителяАртикул,"Модель / Артикул","");
	МодельПроизводителяАртикул=СтрЗаменить(МодельПроизводителяАртикул,"Модель","");
	МодельПроизводителяАртикул=СтрЗаменить(МодельПроизводителяАртикул,"Артикул","");
	МодельПроизводителяАртикул=СокрЛП(МодельПроизводителяАртикул);
КонецПроцедуры

Процедура ПриКопировании(ОбъектКопирования)
	// Вставить содержимое обработчика.
	Этотобъект.СтатусКарточки=Неопределено;
	//ЭтоТобъект.ДополнительныйРеквизитМолоко=Неопределено;
	//ЭтоТобъект.ДополнительныйРеквизитПарфюм=Неопределено;
	//ЭтоТобъект.ДополнительныеРеквизитВода=Неопределено;
	
	ЭтоТобъект.ДополнительныеРеквизитВода=Неопределено;
	
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныеРеквизитВода) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизит_ПитьеваяВода_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныеРеквизитВода,,"Родитель,Владелец,Код");
		
		ДополнительныеРеквизитВода_1.ДополнительныеСрокиГодности.Очистить();
		Для Каждого Стр_1 ИЗ ОбъектКопирования.ДополнительныеРеквизитВода.ДополнительныеСрокиГодности Цикл
			
			Добав=ДополнительныеРеквизитВода_1.ДополнительныеСрокиГодности.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 ИЗ ОбъектКопирования.ДополнительныеРеквизитВода.ГОСТЫИТУ Цикл
			
			Добав=ДополнительныеРеквизитВода.ГОСТЫИТУ.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныеРеквизитВода=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	ЭтоТобъект.ДополнительныеРеквизитОдежда=Неопределено;
	
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныеРеквизитОдежда) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_ПредметыОдежды_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныеРеквизитОдежда,,"Родитель,Владелец,Код");
		
		
		ДополнительныеРеквизитВода_1.ТипМатериалов.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныеРеквизитОдежда.ТипМатериалов Цикл
			Добав=ДополнительныеРеквизитВода_1.ТипМатериалов.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныеРеквизитОдежда.ГОСТЫИТУ Цикл
			Добав=ДополнительныеРеквизитВода_1.ТипМатериалов.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныеРеквизитОдежда.ДопМодельАртикулы Цикл
			Добав=ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		ДополнительныеРеквизитВода_1.РазмерВИныхСистемахИзмерения.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныеРеквизитОдежда.РазмерВИныхСистемахИзмерения Цикл
			Добав=ДополнительныеРеквизитВода_1.РазмерВИныхСистемахИзмерения.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;

		
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныеРеквизитОдежда=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	ЭтоТобъект.ДополнительныеРеквизитФото=Неопределено;
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныеРеквизитФото) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополинительныеРеквизиты_Фото_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныеРеквизитФото,,"Родитель,Владелец,Код");
		
			
		ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныеРеквизитФото.ДопМодельАртикулы Цикл
			Добав=ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
			
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныеРеквизитФото=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	ЭтоТобъект.ДополнительныйРеквизитАльтернативныйТабак=Неопределено;
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитАльтернативныйТабак) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_АльтернативныйТабак_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитАльтернативныйТабак,,"Родитель,Владелец,Код");
		
			
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитАльтернативныйТабак.ГОСТЫИТУ Цикл
			Добав=ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;

		ДополнительныеРеквизитВода_1.СведенияОСвидетельствахОГосРегистрации.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитАльтернативныйТабак.СведенияОСвидетельствахОГосРегистрации Цикл
			Добав=ДополнительныеРеквизитВода_1.СведенияОСвидетельствахОГосРегистрации.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
			
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитАльтернативныйТабак=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	
	
	
	
	ЭтоТобъект.ДополнительныйРеквизитБелье=Неопределено;
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитБелье) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Белье_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитБелье,,"Родитель,Владелец,Код");
		
				
		ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитБелье.ДопМодельАртикулы Цикл
			Добав=ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитБелье.ГОСТЫИТУ Цикл
			Добав=ДополнительныеРеквизитВода_1.ТипМатериалов.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		ДополнительныеРеквизитВода_1.ТипМатериалов.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитБелье.ТипМатериалов Цикл
			Добав=ДополнительныеРеквизитВода_1.ТипМатериалов.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
			
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитБелье=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	
	
	ЭтоТобъект.ДополнительныйРеквизитВелосипед=Неопределено;
	
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитВелосипед) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Велосипеды_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитВелосипед,,"Родитель,Владелец,Код");
		
					
		ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитВелосипед.ДопМодельАртикулы Цикл
			Добав=ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 ИЗ ОбъектКопирования.ДополнительныйРеквизитВелосипед.ГОСТЫИТУ Цикл
			
			Добав=ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		

		
			
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитВелосипед=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	
	
	ЭтоТобъект.ДополнительныйРеквизитКоляски=Неопределено;
	
	

	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитКоляски) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Кресла_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитКоляски,,"Родитель,Владелец,Код");
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитКоляски=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	
	
	ЭтоТобъект.ДополнительныйРеквизитМолоко=Неопределено;
	
	

	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитМолоко) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Молоко_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитМолоко,,"Родитель,Владелец,Код");
		
			
		ДополнительныеРеквизитВода_1.Аллергены.Очистить();
		ДополнительныеРеквизитВода_1.ДополнительныеСрокиГодности.Очистить();
		ДополнительныеРеквизитВода_1.ЭнергетическаяЦенность.Очистить();
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		
		
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитМолоко.Аллергены Цикл
			Добав=ДополнительныеРеквизитВода_1.Аллергены.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитМолоко.ДополнительныеСрокиГодности Цикл
			Добав=ДополнительныеРеквизитВода_1.ДополнительныеСрокиГодности.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитМолоко.ЭнергетическаяЦенность Цикл
			Добав=ДополнительныеРеквизитВода_1.ЭнергетическаяЦенность.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитМолоко.ГОСТЫИТУ Цикл
			Добав=ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитМолоко=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	

	ЭтоТобъект.ДополнительныйРеквизитОбувь=Неопределено;
	

	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитОбувь) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_ОБУВЬ_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитОбувь,,"Родитель,Владелец,Код");
		
			
		ДополнительныеРеквизитВода_1.МатериалНизаПодошвы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.МатериалНизаПодошвы Цикл
			Добав=ДополнительныеРеквизитВода_1.МатериалНизаПодошвы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		ДополнительныеРеквизитВода_1.СведенияОСвидетельствахОГосРегистрации.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.СведенияОСвидетельствахОГосРегистрации Цикл
			Добав=ДополнительныеРеквизитВода_1.СведенияОСвидетельствахОГосРегистрации.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.ДопМодельАртикулы Цикл
			Добав=ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.ГОСТЫИТУ Цикл
			Добав=ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.МатериалСтельки.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.МатериалСтельки Цикл
			Добав=ДополнительныеРеквизитВода_1.МатериалСтельки.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.МатериалПодкладки.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.МатериалПодкладки Цикл
			Добав=ДополнительныеРеквизитВода_1.МатериалПодкладки.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.МатериалВерха.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.МатериалВерха Цикл
			Добав=ДополнительныеРеквизитВода_1.МатериалВерха.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.РазмерВИныхСистемахИзмерения.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбувь.РазмерВИныхСистемахИзмерения Цикл
			Добав=ДополнительныеРеквизитВода_1.РазмерВИныхСистемахИзмерения.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		

		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитОбувь=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
		
	ЭтоТобъект.ДополнительныйРеквизитОбщиеНК=Неопределено;

	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитОбщиеНК) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополинтельныеРеквизиты_ДругиеНК_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитОбщиеНК,,"Родитель,Владелец,Код");
		
			
		ДополнительныеРеквизитВода_1.ДополнительныеСтраныПроизводств.Очистить();
		ДополнительныеРеквизитВода_1.Изготовители.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбщиеНК.ДополнительныеСтраныПроизводств Цикл
			Добав=ДополнительныеРеквизитВода_1.ДополнительныеСтраныПроизводств.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитОбщиеНК.Изготовители Цикл
			Добав=ДополнительныеРеквизитВода_1.Изготовители.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		

		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитОбщиеНК=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	
	ЭтоТобъект.ДополнительныйРеквизитПарфюм=Неопределено;
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитПарфюм) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Парфюмерия_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитПарфюм,,"Родитель,Владелец,Код");
		
				
		ДополнительныеРеквизитВода_1.ДополнительныеСрокиГодности.Очистить();
		Для Каждого Стр_1 ИЗ ОбъектКопирования.ДополнительныйРеквизитПарфюм.ДополнительныеСрокиГодности Цикл
			
			Добав=ДополнительныеРеквизитВода_1.ДополнительныеСрокиГодности.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		
		ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Очистить();
		Для Каждого Стр_1 ИЗ ОбъектКопирования.ДополнительныйРеквизитПарфюм.ГОСТЫИТУ Цикл
			
			Добав=ДополнительныеРеквизитВода_1.ГОСТЫИТУ.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
			
		Конеццикла;
		


		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитПарфюм=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	ЭтоТобъект.ДополнительныйРеквизитРамы=Неопределено;
	
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитРамы) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Рамы_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитРамы,,"Родитель,Владелец,Код");
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитРамы=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	
	
	
	ЭтоТобъект.ДополнительныйРеквизитТабак=Неопределено;
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитТабак) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныйРеквизитТабак_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитТабак,,"Родитель,Владелец,Код");
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитТабак=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;
	
	ЭтоТобъект.ДополнительныйРеквизитШины=Неопределено;
	
	Если ЗначениеЗаполнено(ОбъектКопирования.ДополнительныйРеквизитШины) Тогда
		ДополнительныеРеквизитВода_1=Справочники.ДополнительныеРеквизиты_Шины_ХамелеонЦРПТ.СоздатьЭлемент();
		
		ЗаполнитьЗначенияСвойств(ДополнительныеРеквизитВода_1,ОбъектКопирования.ДополнительныйРеквизитШины,,"Родитель,Владелец,Код");
		
		ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Очистить();
		Для Каждого Стр_1 Из ОбъектКопирования.ДополнительныйРеквизитШины.ДопМодельАртикулы Цикл
			Добав=ДополнительныеРеквизитВода_1.ДопМодельАртикулы.Добавить();
			ЗаполнитьЗначенияСвойств(Добав,Стр_1);
		Конеццикла;
		
		
		ДополнительныеРеквизитВода_1.Записать();
		ЭтоТобъект.ДополнительныйРеквизитШины=ДополнительныеРеквизитВода_1.Ссылка;
	КонецЕсли;

	
	
	
	
	
	ЭтотОбъект.GTIN=Неопределено;
	ЭтотОбъект.id=Неопределено;
	ЭтотОбъект.feed_id=Неопределено;
	ЭтотОбъект.guid="";
	ЭтотОбъект.ОшибкаОбработки="";
	ЭтотОбъект.GTIN="";
	
	
КонецПроцедуры
