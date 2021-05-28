&НаКлиенте
Перем ДанныеИзПользователя;

&НаСервереБезКонтекста
Функция дополнитьСтроку(Ср)
	ВОзврат Обработки._Запуск_ХамелеонЦРПТ.ДополнитьСтроку_11(Ср,14,"0");
	
Конецфункции


&НаКлиенте
Процедура ШтрихкодПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	//штрихКод=СтрЗаменить(ШтрихКод,Символ(29),"");
	////НЕОБХОДИМО БУДЕТ ПОМЕНЯТЬ
	//Если СтрДлина(Штрихкод)=20 И Сред(ШтрихКод,1,2)="00" Тогда
	///	Штрихкод=Сред(Штрихкод,3);
	//КонецЕсли;
	штрихКод=СтрЗаменить(ШтрихКод,Символ(29),"СИМВОЛ29");
	
	
	Сигналить=Ложь;
	ЗаполнитьИнфуПоШтриху(ОбщиеМетоды_НаКлиенте_ХамелеонЦРПТ.ВернутьИнформациюОКМ(ШтрихКод,ДанныеИзПользователя),Сигналить);
	Если Сигналить=Истина И ИздаватьЗвукПрИНеправильнойКМ=Истина Тогда
		
			#Если ВебКлиент Тогда
							#Иначе
		Сигнал();
						#КонецЕсли
		
	Конецесли;
	ПодключитьОбработчикОЖидания("аа",0.1,Истина);
КонецПроцедуры


Процедура ЗаполнитьИнфуПоШтриху(ТипУпаковки,Сигналить)
	
	ШтрихКод=СтрЗаменить(ШтрихКод,"СИМВОЛ29",Символ(29));
	СканируемыйКод=КодироватьСтроку(ШтрихКод,СпособКодированияСтроки.КодировкаURL);
	
	ШтрихКод=СтрЗаменить(ШтрихКод,Символ(29),"");
	Сигналить=Ложь;
	 	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	////НЕОБХОДИМО БУДЕТ ПОМЕНЯТЬ
//	Если СтрДлина(Штрихкод)=20 И Сред(ШтрихКод,1,2)="00" Тогда
//		Штрихкод=Сред(Штрихкод,3);
//	КонецЕсли;
	КоличествоСтрокБыло=Объект.Товары.Количество();
	
	Если 	Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Фармацевтика" Тогда
		Если сред(ШтрихКод,1,1)="/" тогда
			ШтрихКод=Сред(ШтрихКод,2);
		Конецесли;
		
		Если СтрДлина(Штрихкод)>20 Тогда
			
				Если Сред(ШтрихКод,1,2)="01" Тогда
					ШтрихКод=Сред(ШтрихКод,3,14)+Сред(ШтрихКод,19);
				КонецЕсли;
				ШтрихКод=Сред(ШтрихКод,1,27); 
								
			
			Если ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПроверитьСтроку(ШтрихКод,"[0-9]{14}[&#x21;-&#x22;&#x25;-&#x2F;&#x30;-&#x39;&#x41;-&#x5A;&#x5F;&#x61;-&#x7A;]{13}")=Ложь Тогда
				 Сообщить("Штрихкод "+ШтрихКод+" не соответствует шаблону ");
				 Если ИздаватьЗвукПрИНеправильнойКМ Тогда
					 Сигналить=истина;
				Конецесли;
				Возврат;
			Конецесли;
		Иначе
			
			Если ОбщийМодуль_НаСервере_ХамелеонЦРПТ.ПроверитьСтроку(ШтрихКод,"[0-9]{18}")=Ложь Тогда
				 Сообщить("Штрихкод "+ШтрихКод+" не соответствует шаблону ");
				 Если ИздаватьЗвукПрИНеправильнойКМ Тогда
					 Сигналить=истина;
				Конецесли;
				Возврат;
			Конецесли;
			
		
		
		Конецесли;
		
		
		
	Конецесли;

	
	Если ТипУпаковки=Истина 
		И
		Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Табак"
		И Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Альтернативный табак"
		И Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Фармацевтика"
		Тогда
		
	
		//Если Объект.Товары.НайтиСтроки(Новый Структура("КМ",ШтрихКод)).Количество()>0 Тогда
		//	Сообщить("Данный CIS "+Штрихкод+" уже присутствует в документе");
		//	Возврат;
		//КонецЕсли;
		
		
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
			"ВЫБРАТЬ
			|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.Продукция КАК Продукция,
			|	СУММА(ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.КоличествоОстаток) КАК Остаток
			|ИЗ
			|	РегистрНакопления.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Остатки(
			|			,
			|			Организация = &Организация
			|				И СерийныйНомер = &СерийныйНомер) КАК ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки
			|
			|СГРУППИРОВАТЬ ПО
			|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.Продукция
			|ИТОГИ
			|	СУММА(Остаток)
			|ПО
			|	Продукция";
		
		Запрос.УстановитьПараметр("Организация", Объект.Организация);
		Запрос.УстановитьПараметр("СерийныйНомер", ШтрихКод);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
		
		Добавили=Ложь;
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			// Вставить обработку выборки ВыборкаДетальныеЗаписи
			Если 		               ВыборкаДетальныеЗаписи.Остаток<=0 Тогда
				Продолжить;
			КонецЕсли;
			Добавили=Истина;
			Продукция=ВыборкаДетальныеЗаписи.Продукция;
			КМЕсть=Объект.Товары.НайтиСтроки(Новый Структура("КМ",ШтрихКод));
			Если  КМЕсть.Количество()>0 Тогда
				Добав=КМЕсть[0];
				Если Добав.КМВПрограмме>0 Тогда
						Сигналить=Истина;
					Сообщить("Данный CIS "+Штрихкод+" уже присутствует в документе");
					Возврат;
				Конецесли;
				
				Продукция=Добав.Продукция;
			Иначе
			
				Добав=Объект.Товары.Добавить();
			Конецесли;
			Добав.GTIN=Продукция;
			
			Если Объект.СписокТоваровДляАнализа.НайтиСтроки(Новый Структура("GTIN",Продукция)).Количество()=0 Тогда
				Добав_Анализ=Объект.СписокТоваровДляАнализа.Добавить();
				Добав_Анализ.GTIN=Продукция
				
			КонецеслИ;
			
			Добав.КМ=ШтрихКод;
			Добав.СканируемыйКод=СканируемыйКод;
			Добав.КМВПрограмме=1;
			
			//Добав.ТипУпаковки=Перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка;
			
			ППП=Объект.ТоварыСвернуто.НайтиСтроки(Новый структура("gtin",Продукция));
			Если ППП.Количество()=0 Тогда
				Добав_1=Объект.ТоварыСвернуто.Добавить();
				Добав_1.GTIN=Продукция;
			Иначе
				Добав_1=ППП[0];
			КонецЕсли;
			Добав_1.КМВПрограмме=Добав_1.КМВПрограмме+1;
			
		КонецЦикла;
		
		Если Добавили=ложЬ Тогда
			
			Продукция=Справочники.Продукция_ХамелеонЦРПТ.ПустаяСсылка();
			КМЕсть=Объект.Товары.НайтиСтроки(Новый Структура("КМ",ШтрихКод));
			Если  КМЕсть.Количество()>0 Тогда
				Добав=КМЕсть[0];
				Если Добав.КМВПрограмме>0 Тогда
						Сигналить=Истина;
					Сообщить("Данный CIS "+Штрихкод+" уже присутствует в документе");
					Возврат;
				Конецесли;
				Продукция=Добав.Продукция;
			Иначе
			
				Добав=Объект.Товары.Добавить();
			Конецесли;
			Добав.GTIN=Продукция;
			
			Если Объект.СписокТоваровДляАнализа.НайтиСтроки(Новый Структура("GTIN",Продукция)).Количество()=0 Тогда
				Добав_Анализ=Объект.СписокТоваровДляАнализа.Добавить();
				Добав_Анализ.GTIN=Продукция
				
			КонецеслИ;
			
			Добав.КМ=ШтрихКод;
			Добав.СканируемыйКод=СканируемыйКод;
			Добав.КМВПрограмме=1;
			
			//Добав.ТипУпаковки=Перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка;
			
			ППП=Объект.ТоварыСвернуто.НайтиСтроки(Новый структура("gtin",Продукция));
			Если ППП.Количество()=0 Тогда
				Добав_1=Объект.ТоварыСвернуто.Добавить();
				Добав_1.GTIN=Продукция;
			Иначе
				Добав_1=ППП[0];
			КонецЕсли;
			Добав_1.КМВПрограмме=Добав_1.КМВПрограмме+1;
			

		Конецесли;
		
		Возврат;
	КонецЕсли;
	
	
Если Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Табак"
		И Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование<>"Альтернативный табак" ТОгда 
	ШтрихКод_1=(ШтрихКод);
	
	//ШтрихКод_1=КодироватьСтроку(ШтрихКод,СпособКодированияСтроки.КодировкаURL);
	//штрихКод=СтрЗаменить(ШтрихКод_1,"%1D","");
	ШтрихКод=Сред(ШтрихКод,1,38);
	//штрихКод_1=РаскодироватьСтроку(ШтрихКод,СпособКодированияСтроки.КодировкаURL);
			Если Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Фото" Тогда
								ШтрихКод=Сред(ШтрихКод,1,38);
		ИначеЕсли Сред(штрихКод_1,32,3)<>"240" Тогда
								ШтрихКод=Сред(ШтрихКод,1,31);
								//ШтрихКод=Сред(штрихКод_1,1,Найти(штрихКод_1,"%1D")-1);
								//ШтрихКод=РаскодироватьСтроку(ШтрихКод,СпособКодированияСтроки.КодировкаURL);
							Иначе
								
								           ШтрихКод=штрихКод_1;
							
							КонецЕсли;
							
							
							Если Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Фармацевтика" Тогда
		Если Сред(ШтрихКод,1,2)="01" Тогда
			ШтрихКод=Сред(ШтрихКод,3,14)+Сред(ШтрихКод,19);
		КонецЕсли;
								
							КОнецЕсли;
				КонецЕсли;
							
	Если СтрДлина(ШтрихКод)>50 Тогда
		ШтрихКод=Сред(ШтрихКод,1,35);
	ИначеЕсли Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Альтернативный табак" Тогда
		Если СтрДлина(ШтрихКод)<>18 И Сред(ШтрихКод,1,2)="01" Тогда
			
ШтрихКод=Сред(ШтрихКод,1,25);
Иначе
ШтрихКод=Сред(ШтрихКод,1,21);

		КонецЕслИ;
		
//	ИначеЕсли Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Альтернативный табак" 
//		Тогда
//		Если СтрДлина(ШтрихКод)<>18 И Сред(ШтрихКод,1,2)="01" Тогда
//			
//ШтрихКод=Сред(ШтрихКод,1,25);			
//Иначе
//ШтрихКод=Сред(ШтрихКод,1,21);
//		КонецЕслИ;
	ИначеЕсли Объект.ТекущийПользователь.СайтыВходаВСистему.Наименование="Табак" 
		Тогда
		Если СтрДлина(ШтрихКод)<>18 И Сред(ШтрихКод,1,2)<>"01" Тогда
			
				ШтрихКод=Сред(ШтрихКод,1,25);			
		КонецЕслИ;
	КонецЕсли;
	
	//ШтрихКод=КодироватьСтроку(ШтрихКод,СпособКодированияСтроки.КодировкаURL);
			
		
	//Если РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().ПриЗаполненииОтгрузкиНеУчитыватьОстаток Тогда
		
		Попытка
			ШтрихКодИщем=Штрихкод;
			Если Сред(ШтрихКодИщем,1,2)="01" Тогда
				ШтрихКодИщем=Сред(ШтрихКодИщем,3);
			КонецЕсли;
			
			Продукция=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("gtin",
			Число(Сред(ШтрихКодИщем,1,14)));
			
			Если Продукция.GTIN<>Число(Сред(ШтрихКодИщем,1,14)) Тогда
				Пр=Справочники.Продукция_ХамелеонЦРПТ.СоздатьЭлемент();
				Пр.GTIN=Число(Сред(ШтрихКодИщем,1,14));
				Пр.Наименование=Сред(ШтрихКодИщем,1,14);
				Пр.НаименованиеТовара=Сред(ШтрихКодИщем,1,14);
				Пр.Записать();
				Продукция=Пр.Ссылка;
				
			КонецЕсли;
			
		Исключение
			
		Если КоличествоСтрокБыло=Объект.СерийныеНомера.Количество() Тогда
				Сигналить=Истина;
			Сообщить("КМ "+Строка(Штрихкод)+" не добавлена");
		Конецесли;
			
			Возврат;
		КонецПопытки;
			КМЕсть=Объект.Товары.НайтиСтроки(Новый Структура("КМ",ШтрихКод));
			Если  КМЕсть.Количество()>0 Тогда
				Добав=КМЕсть[0];
				Если Добав.КМВПрограмме>0 Тогда
					Сигналить=Истина;
					Сообщить("Данный CIS "+Штрихкод+" уже присутствует в документе");
					Возврат;
				Конецесли;
				
				Продукция=Добав.GTIN;
			Иначе
			
				Добав=Объект.Товары.Добавить();
			Конецесли;
			Добав.GTIN=Продукция;
			
			Если Объект.СписокТоваровДляАнализа.НайтиСтроки(Новый Структура("GTIN",Продукция)).Количество()=0 Тогда
				Добав_Анализ=Объект.СписокТоваровДляАнализа.Добавить();
				Добав_Анализ.GTIN=Продукция
				
			КонецеслИ;
			
			Добав.КМ=ШтрихКод;
			Добав.СканируемыйКод=СканируемыйКод;
			Добав.КМВПрограмме=1;
			
			
			//Добав.ТипУпаковки=Перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка;
			
			ППП=Объект.ТоварыСвернуто.НайтиСтроки(Новый структура("gtin",Продукция));
			Если ППП.Количество()=0 Тогда
				Добав_1=Объект.ТоварыСвернуто.Добавить();
				Добав_1.GTIN=Продукция;
			Иначе
				Добав_1=ППП[0];
			КонецЕсли;
			Добав_1.КМВПрограмме=Добав_1.КМВПрограмме+1;
			

		
		
		//Если КоличествоСтрокБыло=Объект.СерийныеНомера.Количество() Тогда
		//		Сигналить=Истина;
		//	Сообщить("КМ "+Строка(Штрихкод)+" не добавлена");
		//Конецесли;
		
		
		
		 		
		
КонецПроцедуры


&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	// Вставить содержимое обработчика.
	
	//РегДв=РегистрыСведений.ТабличнаяЧастьИнвентаризации_ХамелеонЦРПТ.СоздатьНаборЗаписей();
	//РегДв.Отбор.ДокументИнвентаризации.Установить(ТекущийОбъект);
	//РегДв.Записать(Истина);
	//
	//
	//ТаблицаДляЗаписиВРегистр=ТекущийОбъект.Товары.Выгрузить();
	//ТаблицаДляЗаписиВРегистр.Колонки.Добавить("ДокументИнвентаризации");
	//ТаблицаДляЗаписиВРегистр.ЗаполнитьЗначения(ТекущийОбъект.Ссылка,"ДокументИнвентаризации");
	//
	//РегДв=РегистрыСведений.ТабличнаяЧастьИнвентаризации_ХамелеонЦРПТ.СоздатьНаборЗаписей();

	//РегДв.Загрузить(ТаблицаДляЗаписиВРегистр);		
	//РегДв.Записать(Ложь);	
	//ТекущийОбъект.Товары.Очистить();
	
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Настройки=РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить();
	
	ИздаватьЗвукПрИНеправильнойКМ = Настройки.ИздаватьЗвукПрИНеправильнойКМ;
	
	ОбновитьВнешниеКнопки();
	
	МодульПриСозданииДокументов_ХамелеонЦРПТ.Инвентаризация_ХамелеонЦРПТ_ПриСозданииНаСервере(ЭтаФорма,Отказ,СтандартнаяОбработка);
	
	
КонецПроцедуры


Процедура ОбновитьВнешниеКнопки()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ВнешниеОбработки_ХамелеонЦРПТ.ИмяВнешнейОБработки,
		|	ВнешниеОбработки_ХамелеонЦРПТ.НаименованиеКнопки,
		|	ВнешниеОбработки_ХамелеонЦРПТ.Код
		|ИЗ
		|	Справочник.ВнешниеОбработки_ХамелеонЦРПТ КАК ВнешниеОбработки_ХамелеонЦРПТ
		|ГДЕ
		|	ВнешниеОбработки_ХамелеонЦРПТ.Наименование = &Наименование";
	
	Запрос.УстановитьПараметр("Наименование", Метаданные.НайтиПоТипу(ТипЗнч(Объект.Ссылка)).ПолноеИмя());
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
		ИмяКоманды="Команда"+ВыборкаДетальныеЗаписи.Код;
		Попытка
		КомандаФормы = Команды.Добавить(ИмяКоманды);
		КомандаФормы.Действие = "Подключаемый_ВыполнитьКомандуВнешняя";
		КомандаФормы.Заголовок = ВыборкаДетальныеЗаписи.ИмяВнешнейОБработки;
		КомандаФормы.ИзменяетСохраняемыеДанные = Ложь;
		КомандаФормы.Отображение = ОтображениеКнопки.Текст;
		
		//ОписаниеКомандыПечати.ИмяКомандыНаФорме = ИмяКоманды;
		
		НовыйЭлемент = Элементы.Добавить("ГруппаКнопокВнешняя" + ИмяКоманды, Тип("КнопкаФормы"), Элементы.ГруппаКнопокВнешняя);
		НовыйЭлемент.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
		НовыйЭлемент.Заголовок=ВыборкаДетальныеЗаписи.НаименованиеКнопки;
		НовыйЭлемент.ИмяКоманды = ИмяКоманды;
	Исключение
		КонецПопытки;
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
КонецПроцедуры


Функция ПолучитьИмяВнешней(ИмяФайла)
    АдресВоВременномХранилище = ПоместитьВоВременноеХранилище(ИмяФайла);
    ИмяОбр = ВнешниеОбработки.Подключить(АдресВоВременномХранилище,,Ложь);
    Возврат ИмяОбр;
КонецФункции


&НаКлиенте
Процедура Подключаемый_ВыполнитьКомандуВнешняя(Команда)
	
	// Вставить содержимое обработчика.	// Вставить содержимое обработчика.
	Попытка
		ДвоичныеДанные=Новый ДвоичныеДанные(ВернутьИмяФайла(Команда.Имя));
		ОбработкаИмя=ПолучитьИмяВнешней(Двоичныеданные);
		ОткрытьФорму("ВнешняяОбработка."+ОбработкаИмя+".Форма",,ЭтаФорма);
	Исключение
			Попытка
#Если ТолстыйКлиентОбычноеПриложение  Тогда
				ВернутьВн(ВернутьИмяФайла(Команда.Имя));
#Иначе
				
			ПоказатьПредупреждение(,"Не удалось выполнить внешнюю обработку");
#КонецЕсли
			Исключение
				ПоказатьПредупреждение(,"Не удалось выполнить внешнюю обработку");
			КонецПопытки;
		//	
	//	
	КонецПопытки;

	//УправлениеПечатьюКлиент.ВыполнитьПодключаемуюКомандуПечати(Команда, ЭтаФорма, Объект);
	
КонецПроцедуры


#Если ТолстыйКлиентОбычноеПриложение  Тогда
&НаКлиенте
Процедура ВернутьВн(ДвоичныеДанные)
	//ИмяВременФ=ПолучитьИмяВременногоФайла();
	//ДвоичныеДанные.Записать(ИмяВременФ);
	ВнешняяОбработка=ВнешниеОбработки.Создать(ДвоичныеДанные);
	Фоорма=ВнешняяОбработка.ПолучитьФорму(,ЭтаФорма);
	Попытка
		Фоорма.УФ=ЭтаФорма;
	Исключение
	КонецПопытки;
	Фоорма.Открыть();
Конецпроцедуры      	
#КонецЕсли


Процедура ЗаписатьИмяФайлаВнешняяобработка(ИмяФайла)
	
	НаимСправочника=Метаданные.НайтиПоТипу(ТипЗнч(Объект.Ссылка)).ПолноеИмя();
	Спр=Справочники.ВнешниеОбработки_ХамелеонЦРПТ.НайтиПоНаименованию(НаимСправочника,Истина);
	Если Спр<>Справочники.ВнешниеОбработки_ХамелеонЦРПТ.ПустаяСсылка() Тогда
		Спр=Спр.ПолучитьОбъект();
	Иначе
		
		Спр=Справочники.ВнешниеОбработки_ХамелеонЦРПТ.СоздатьЭлемент();
		
	Конецесли;
	Спр.Наименование=НаимСправочника;
	Спр.ИмяВнешнейОБработки=ИмяФайла;
	Спр.Записать();;
КонецПроцедуры


Функция ВернутьИмяФайла(Команда)
	СпрВн=Справочники.ВнешниеОбработки_ХамелеонЦРПТ.НайтиПоКоду(Сред(Команда,8));
	
	Возврат СпрВн.ИмяВнешнейОБработки
	//НаимСправочника=Метаданные.НайтиПоТипу(ТипЗнч(Объект.Ссылка)).ПолноеИмя();
	//Спр=Справочники.ВнешниеОбработки_ХамелеонЦРПТ.НайтиПоНаименованию(НаимСправочника,Истина);
	//Если Спр<>Справочники.ВнешниеОбработки_ХамелеонЦРПТ.ПустаяСсылка() Тогда
	//	Возврат Спр.ИмяВнешнейОБработки;
	//Конецесли;
	
КонецФункции



&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика.
	Если Не ЗначениеЗаполнено(ТекущийПользователь) тогда
		Форм=ПолучитьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
		Если НЕ Форм.Открыта() Тогда
			Форм.Открыть();
			ЭтаФорма.Активизировать();
		Конецесли;
		ТекущийПользователь=Форм.Пользователь;
	КонецЕсли;
	Если Не ЗначениеЗаполнено(Объект.ТекущийПользователь) тогда
		объект.ТекущийПользователь=ТекущийПользователь;
	Конецесли;
	
	ДанныеИзПользователя=ПолучитьИзПользователя();
	
КонецПроцедуры


Функция ПолучитьИзПользователя()
	    Струк=Неопределено;
	Если Объект.ТекущийПользователь.Организация.ИНН=ТекущийПользователь.Организация.ИНН 
		И Объект.ТекущийПользователь.СайтыВходаВСистему=ТекущийПользователь.СайтыВходаВСистему Тогда
		Струк=Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(ТекущийПользователь);
	ИначеЕсли 
		Объект.ТекущийПользователь.ПометкаУдаления=Ложь Тогда
		Струк=Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(Объект.ТекущийПользователь);
		
	Иначе
		
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
	
	Запрос.УстановитьПараметр("Организация", Объект.ТекущийПользователь.Организация.ИНН);
	Запрос.УстановитьПараметр("СайтыВходаВСистему", Объект.ТекущийПользователь.СайтыВходаВСистему);
	
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
			Струк=Обработки._Запуск_ХамелеонЦРПТ.ПолучитьИзПользователя(НайтиПольз);
		КонецЕсли;
		
	КонецЕслИ;
	
	
	Если ЗначениеЗаполнено(Струк) тогда
	
		Струк.Вставить("РасчетОстатков",РегистрыСведений.НастройкиПрограммы_ХамелеонЦРПТ.Получить().РасчетОстатков);
	
		Возврат Струк;
	Иначе
		Возврат Неопределено
	КонецЕсли;
КонецФункции

&НаКлиенте
Процедура ТекущийПользовательПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ДанныеИзПользователя=ПолучитьИзПользователя();
	
КонецПроцедуры

&НаКлиенте
Процедура ШтрихкодАвтоПодбор(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, Ожидание, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Если СтрДлина(Текст)>=18 Тогда
		СтандартнаяОбработка=Ложь;
		
		Текст=СтрЗаменить(Текст,Символ(29),"");
	     ШтрихКод=Текст;
		  
		
		ШтрихкодПриИзменении(Элемент);	
	Иначе
		ШтрихКод="";
		
		ПодключитьОбработчикОжидания("аа",0.1,Истина);
	КонецЕслИ;
	
КонецПроцедуры

&НаКлиенте
Процедура аа() Экспорт
	ШтрихКод="";
	ЭтаФорма.ТекущийЭлемент=Элементы.Штрихкод;
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	// Вставить содержимое обработчика.
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПослеУдаления(Элемент)
	// Вставить содержимое обработчика.
	СвернемЗановоНаСервере();
КонецПроцедуры

Процедура СвернемЗановоНаСервере()
	ТаблицаК=Объект.Товары.Выгрузить();
	ТаблицаК.Свернуть("GTIN","КМВПрограмме,КМВЦРПТ");
	
	Объект.ТоварыСвернуто.Загрузить(ТаблицаК);
	
	
КонецПроцедуры


Функция СоздаемКорректировкуПустую(ПолучимМассивUNBY)
	
	Автокорректировка=Документы.АвтоКорректировкаОстатков_ХамелеонЦРПТ.СоздатьДокумент();
	Автокорректировка.ТекущийПользователь=Объект.ТекущийПользователь;
	Автокорректировка.Организация=Объект.ТекущийПользователь.Организация;
	Для Каждого Стр_1 Из ПолучимМассивUNBY Цикл
		Добав=Автокорректировка.ФильтрПоGTIN.Добавить();
		Добав.GTIN=Стр_1.Значение;
	КонецциклА;
	Автокорректировка.Дата=текущаядата();
	Автокорректировка.Записать(РежимЗаписиДокумента.Запись);
	Возврат Автокорректировка.Ссылка;
	
КонецФункции

&НаСервереБезКонтекста
Функция Орг(Поль)
	Возврат Поль.Организация
КонецФункции

&НаКлиенте
Процедура СоздатьАвткорректировку(Команда)
	// Вставить содержимое обработчика.
	
	ПолучимМассивUNBY=Новый СписокЗначений;
	//Для Каждого Стр_1 Из Элементы.ТоварыСвернуто.ВыделенныеСтроки Цикл
	//	Стр_2=Объект.ТоварыСвернуто.НайтиПоИдентификатору(Стр_1);
	//	ПолучимМассивUNBY.Добавить(Стр_2.GTIN);
		
	//Конеццикла;
	
	//КорректировкуСоздаем=СоздаемКорректировкуПустую(ПолучимМассивUNBY);
	
	Форм=ОткрытьФорму("Документ.АвтоКорректировкаОстатков_ХамелеонЦРПТ.Форма.ФормаДокумента",
	Новый Структура("Ключ",ПредопределенноеЗначение("Документ.АвтоКорректировкаОстатков_ХамелеонЦРПТ.ПустаяСсылка")));
	Форм.Объект.ТекущийПользователь=Объект.ТекущийПользователь;
	
	Форм.Объект.Организация=Орг(Объект.ТекущийПользователь);
	Форм.Объект.Дата=Текущаядата();
	Для Каждого Стр_1 Из Элементы.ТоварыСвернуто.ВыделенныеСтроки Цикл
		Стр_2=Объект.ТоварыСвернуто.НайтиПоИдентификатору(Стр_1);
		Добав=Форм.ОБъект.ФильтрПоGTIN.Добавить();
		Добав.GTIN=Стр_2.GTIN;
		
	Конеццикла;
	
	Форм.СоздатьАвтокорректировкуПоДаннымGTIN(Команда);
	Форм.ОставитьРасхождения(Команда);
	Сообщить=Ложь;
	Если Форм.Объект.Товары.Количество()>0 Тогда
		Форм.Записать(Новый Структура("РежимЗаписи",РежимЗаписиДОкумента.Проведение));
	Иначе
		Сообщить=Истина;
	Конецесли;
//	Форм.Записать(РежимЗаписиДОкумента.Проведение);
	Форм.Закрыть();
	Если Сообщить=Истина Тогда
				Сообщить("Расхождений по данным GTIN нет");

		Конецесли;
	ЗаполнимКоличествоВЦРПТ(ПолучимМассивUNBY);
КонецПроцедуры

Процедура ЗаполнимКоличествоВЦРПТ(ПолучимМассивUNBY)
	
	ТТТ=Объект.Товары.Выгрузить();
	ТТТ.ЗаполнитьЗначения(0,"КМВЦРПТ");
	Объект.Товары.Загрузить(ТТТ);
	ТТТ=Объект.ТоварыСвернуто.Выгрузить();
	ТТТ.ЗаполнитьЗначения(0,"КМВЦРПТ");
	Объект.ТоварыСвернуто.Загрузить(ТТТ);
	
	
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.СерийныйНомер КАК СерийныйНомер,
		|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.КоличествоОстаток КАК КоличествоОстаток,
		|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.Продукция КАК Продукция
		|ИЗ
		|	РегистрНакопления.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Остатки(
		|			,
		|			Организация = &Организация
		|				И Продукция В (&Продукция)) КАК ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки
		|
		|ОБЪЕДИНИТЬ ВСЕ
		|
		|ВЫБРАТЬ
		|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки.СерийныйНомер,
		|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки.КоличествоОстаток,
		|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки.Продукция
		|ИЗ
		|	РегистрНакопления.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Остатки(
		|			,
		|			Организация = &Организация
		|				И Продукция В (&Продукция)) КАК ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки
		|
		|ОБЪЕДИНИТЬ ВСЕ
		|
		|ВЫБРАТЬ
		|	ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки.СерийныйНомер,
		|	ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки.КоличествоОстаток,
		|	ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки.Продукция
		|ИЗ
		|	РегистрНакопления.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Остатки(
		|			,
		|			Организация = &Организация
		|				И Продукция В (&Продукция)) КАК ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки
		|ИТОГИ
		|	СУММА(КоличествоОстаток)
		|ПО
		|	Продукция,
		|	СерийныйНомер";
	
	
	Продукция=Новый СписокЗначений;
	Для Каждого Стр Из Объект.СписокТоваровДляАнализа Цикл
		Продукция.Добавить(Стр.GTIN)
	Конеццикла;
	
	//Продукция=ПолучимМассивUNBY;
	
	Запрос.УстановитьПараметр("Организация", Объект.ТекущийПользователь.Организация);
	Запрос.УстановитьПараметр("Продукция", Продукция);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
		ВыборкаСер=ВыборкаДетальныеЗаписи.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
		Пока      ВыборкаСер.Следующий() Цикл
			
			ШтрихКод=ВыборкаСер.СерийныйНомер;
			
			Продукция=ВыборкаСер.Продукция;
			КМЕсть=Объект.Товары.НайтиСтроки(Новый Структура("КМ",ШтрихКод));
			Если  КМЕсть.Количество()>0 Тогда
				Добав=КМЕсть[0];
				Если Добав.КМВЦРПТ>0 Тогда
						Сигналить=Истина;
					Сообщить("Данный CIS "+Штрихкод+" уже присутствует в документе");
					Продолжить;
				Конецесли;
				Если ЗначениезАполнено(Добав.GTIN) тогда
					Продукция=Добав.GTIN;
				Конецесли;
			Иначе
			
				Добав=Объект.Товары.Добавить();
			Конецесли;
			Добав.GTIN=Продукция;
			
			Добав.КМ=ШтрихКод;
			//Добав.СканируемыйКод=СканируемыйКод;
			Добав.КМВЦРПТ=1;
			
			//Добав.ТипУпаковки=Перечисления.Тип_КМ_ХамелеонЦРПТ.Упаковка;
			
			ППП=Объект.ТоварыСвернуто.НайтиСтроки(Новый структура("gtin",Продукция));
			Если ППП.Количество()=0 Тогда
				Добав_1=Объект.ТоварыСвернуто.Добавить();
				Добав_1.GTIN=Продукция;
			Иначе
				Добав_1=ППП[0];
			КонецЕсли;
			Добав_1.КМВЦРПТ=Добав_1.КМВЦРПТ+1;
			
			
			
		Конеццикла;
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
	
	ШтрихКод="";
	
	
КонецПроцедуры


&НаКлиенте
Процедура Команда7(Команда)
	// Вставить содержимое обработчика.
	ОткрытьФорму("Справочник.ВнешниеОбработки_ХамелеонЦРПТ.Форма.ФормаСписка",
	Новый структура("Тип",
		ТипДокумента()));
КонецПроцедуры


Функция ТипДокумента()
	Возврат Метаданные.НайтиПоТипу(ТипЗнч(Объект.Ссылка)).ПолноеИмя()
КонецФункции

&НаСервереБезКонтекста
Процедура HELPНаСервере(Теккк)
	// Вставить содержимое обработчика.
	Мак=Документы.Инвентаризация_ХамелеонЦРПТ.ПолучитьМакет("HELP");
	Теккк=Мак;
КонецПроцедуры


&НаКлиенте
Процедура HELP(Команда)
	Текст=Новый ТекстовыйДокумент;
	HELPНаСервере(Текст);
	Текст.Показать();

КонецПроцедуры

&НаСервере
Процедура СоздатьДокументыНаСервере()
	// Вставить содержимое обработчика.
	
	ДокумСписания1=Документы.СписаниеКМНанесенныхНеНанесенныхНаТовар_ХамелеонЦРПТ.СоздатьДокумент();
	ДокумСписания1.Организация=Объект.ТекущийПользователь.Организация;
	ДокумСписания1.ТекущийПользователь=Объект.ТекущийПользователь;
	//ДокумСписания1.ТипПродукции=Перечисления.ТипПродукции_ХамелеонЦРПТ.
	ДокумСписания1.ТипСписанияСУЗ=Перечисления.ПричинаСписанияСУЗ_ХамелеонЦРПТ.OTHER;
	ДокумСписания1.ПричинаСписания=Перечисления.ПричинаСписания_ХамелеонЦРПТ.KM_LOST;
	ДокумСписания1.ВидСписания=перечисления.ВидДокументаСписания_ХамелеонЦРПТ.КМНеНанесенныйНаТовар;
	ДокумСписания1.Дата=Текущаядата();
	
	ДокумСписания2=Документы.СписаниеКМНанесенныхНеНанесенныхНаТовар_ХамелеонЦРПТ.СоздатьДокумент();
	ДокумСписания2.Организация=Объект.ТекущийПользователь.Организация;
	ДокумСписания2.ТекущийПользователь=Объект.ТекущийПользователь;
	//ДокумСписания1.ТипПродукции=Перечисления.ТипПродукции_ХамелеонЦРПТ.
	ДокумСписания2.ТипСписанияСУЗ=Перечисления.ПричинаСписанияСУЗ_ХамелеонЦРПТ.OTHER;
	ДокумСписания2.ПричинаСписания=Перечисления.ПричинаСписания_ХамелеонЦРПТ.KM_LOST;
	ДокумСписания2.ВидСписания=перечисления.ВидДокументаСписания_ХамелеонЦРПТ.СИсКМНанесенныйНаТоварБезВыводаИзОборота;
	ДокумСписания2.Дата=Текущаядата();
	
	
	Для Каждого СтР_1 Из Объект.Товары Цикл
		Если Стр_1.КМВПрограмме<>Стр_1.КМВЦРПТ 
			И (Стр_1.КМВПрограмме=0 ИЛИ Стр_1.КМВЦРПТ=0)
			Тогда
			Если ЗначениеЗаполнено(Стр_1.КМВЦРПТ) Тогда
				
				
				//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
				// Данный фрагмент построен конструктором.
				// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
				
				Запрос = Новый Запрос;
				Запрос.Текст = 
					"ВЫБРАТЬ
					|	СУММА(ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки.КоличествоОстаток) КАК КоличествоОстаток
					|ИЗ
					|	РегистрНакопления.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Остатки(
					|			,
					|			Организация = &Организация
					|				И СерийныйНомер = &СерийныйНомер) КАК ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки
					|ИТОГИ
					|	СУММА(КоличествоОстаток)
					|ПО
					|	ОБЩИЕ";
				
				Запрос.УстановитьПараметр("Организация", Объект.ТекущийПользователь.Организация);
				Запрос.УстановитьПараметр("СерийныйНомер", Стр_1.КМ);
				
				РезультатЗапроса = Запрос.Выполнить();
				
				ВыборкаОбщийИтог = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
				
				ВыборкаОбщийИтог.Следующий();		// Общий итог
				
				// Вставить обработку выборки ВыборкаОбщийИтог
				
				ВыборкаКоличествоОстаток = ВыборкаОбщийИтог.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
				ВыборкаКоличествоОстаток.Следующий();
				
				Если ЗначениеЗаполнено(ВыборкаКоличествоОстаток.КоличествоОстаток) И ВыборкаКоличествоОстаток.КоличествоОстаток>0 Тогда
					ДокумДлясписания=ДокумСписания2.СерийныеНомера.Добавить();
					ДокумДлясписания.cis=Стр_1.КМ;
					ДокумДлясписания.GTIN=xmlString(Стр_1.GTIN.GTIN);
					ДокумДлясписания.НаименованиеТовара=Стр_1.GTIN;
					ДокумДлясписания.ПричинаСписанияКМ=ДокумСписания2.ПричинаСписания;
					ДокумДлясписания.СерийныйНомер=Стр_1.КМ;
					
					НСтр=ДокумСписания2.Товары.Найти(Стр_1.GTIN,"GTIN");
					Если НСтр=Неопределено Тогда
						НСтр=ДокумСписания2.Товары.Добавить();
						НСтр.GTIN=Стр_1.GTIN;
						НСтр.КодТНВЭД=Стр_1.GTIN.КодТНВЭД;
						НСтр.НомерСтрокиСвязи=НСтр.НомерСтроки;
						
					Конецесли;
					ДокумДлясписания.НомерСтрокиСвязи=НСтр.НомерСтрокиСвязи;
					
					НСтр.КоличествоКМ=НСтр.КоличествоКМ+1;
					
					
				Иначе
					ДокумДлясписания=ДокумСписания1.СерийныеНомера.Добавить();
					ДокумДлясписания.cis=Стр_1.КМ;
					ДокумДлясписания.GTIN=xmlString(Стр_1.GTIN.GTIN);
					ДокумДлясписания.НаименованиеТовара=Стр_1.GTIN;
					ДокумДлясписания.ПричинаСписанияКМ=ДокумСписания2.ПричинаСписания;
					ДокумДлясписания.СерийныйНомер=Стр_1.КМ;
					
					НСтр=ДокумСписания1.Товары.Найти(Стр_1.GTIN,"GTIN");
					Если НСтр=Неопределено Тогда
						НСтр=ДокумСписания1.Товары.Добавить();
						НСтр.GTIN=Стр_1.GTIN;
						НСтр.КодТНВЭД=Стр_1.GTIN.КодТНВЭД;
						НСтр.НомерСтрокиСвязи=НСтр.НомерСтроки;
						
					Конецесли;
					ДокумДлясписания.НомерСтрокиСвязи=НСтр.НомерСтрокиСвязи;
					
					НСтр.КоличествоКМ=НСтр.КоличествоКМ+1;
				Конецесли;
				
				//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

				
				
			Конецесли;
			
			
		Конецесли;
		
		
	Конеццикла;
	
	
	Если ДокумСписания2.Товары.Количество()>0 Тогда
		ДокумСписания2.Записать();
		Сообщить("Создан документ "+Строка(ДокумСписания2.Ссылка));
	Конецесли;
	
	Если ДокумСписания1.Товары.Количество()>0 Тогда
		ДокумСписания1.Записать();
		Сообщить("Создан документ "+Строка(ДокумСписания1.Ссылка));
	Конецесли;
	
КонецПроцедуры

&НаКлиенте
Процедура СоздатьДокументы(Команда)
	СоздатьДокументыНаСервере();
КонецПроцедуры

&НаСервере
Процедура СоздатьПеремаркировкуНаСервере()
	// Вставить содержимое обработчика.
	
	
	ДокумОприходования=Документы.ЗаказМарок_ХамелеонЦРПТ.СоздатьДокумент();
	ДокумОприходования.ТекущийПользователь=Объект.ТекущийПользователь;
	ДокумОприходования.Дата=Текущаядата();
	ДокумОприходования.СпособВыпускаТоваров=Перечисления.СпособВыпускаТоваров_ХамелеонЦРПТ.Перемаркировка;
	ДокумОприходования.СпособИзготовленияСИ=Перечисления.СпособИзготовленияСИ_ХамелеонЦРПТ.ЦентрЭтикетированияИМаркировки;
	ДокумОприходования.Организация=Объект.ТекущийПользователь.Организация;
	
	
	Для Каждого СтР_1 Из Объект.Товары Цикл
		Если Стр_1.КМВПрограмме<>Стр_1.КМВЦРПТ 
			И (Стр_1.КМВПрограмме=0 ИЛИ Стр_1.КМВЦРПТ=0)
			Тогда
			Если ЗначениеЗаполнено(Стр_1.GTIN) И ЗначениеЗаполнено(Стр_1.КМВПрограмме) Тогда
				
				Добав=ДокумОприходования.Товары.Найти(Стр_1.GTIN,"GTIN");
				если Добав=Неопределено  Тогда
					Добав=ДокумОприходования.Товары.Добавить();
					Добав.GTIN=Стр_1.GTIN;
					Если Не ЗначениеЗаполнено(Добав.СпособФормированияСН) Тогда
						Добав.СпособФормированияСН=ОБъект.ТекущийПользователь.СпособФормированияСН;
						
					КонецЕслИ;
					Если Не ЗначениеЗаполнено(Добав.ВидСИ) Тогда
						Добав.ВидСИ=ОБъект.ТекущийПользователь.ВидСИ;
						
					КонецЕслИ;
					Если Не ЗначениеЗаполнено(Добав.ВидМаркировки) Тогда
						Добав.ВидМаркировки=ОБъект.ТекущийПользователь.ВидМаркировки;
					КонецЕслИ;
				Конецесли;
				Добав.КоличествоКМ=Добав.КоличествоКМ+1;
				
			Конецесли;
			
			
		Конецесли;
		
		
	Конеццикла;
	
	
	Если ДокумОприходования.Товары.Количество()>0 Тогда
		ДокумОприходования.Записать();
		Сообщить("Создан документ "+Строка(ДокумОприходования.Ссылка));
	Конецесли;
	
	
КонецПроцедуры

&НаКлиенте
Процедура СоздатьПеремаркировку(Команда)
	СоздатьПеремаркировкуНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьОстаткиИз1С(Команда)
	// Вставить содержимое обработчика.
	ЗагрузитьОстаткиИз1СНаСервере();
КонецПроцедуры

Процедура ЗагрузитьОстаткиИз1СНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.СерийныйНомер КАК СерийныйНомер,
		|	ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки.КоличествоОстаток КАК КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиКМЭмитированые_ХамелеонЦРПТ.Остатки КАК ОстаткиКМЭмитированые_ХамелеонЦРПТОстатки
		|
		|ОБЪЕДИНИТЬ ВСЕ
		|
		|ВЫБРАТЬ
		|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки.СерийныйНомер,
		|	ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки.КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиКМ_в_Обороте_ХамелеонЦРПТ.Остатки(, ) КАК ОстаткиКМ_в_Обороте_ХамелеонЦРПТОстатки
		|
		|ОБЪЕДИНИТЬ ВСЕ
		|
		|ВЫБРАТЬ
		|	ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки.СерийныйНомер,
		|	ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки.КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТ.Остатки(, ) КАК ОстаткиКМНеобходимоВвестиОтчетомОбИспользовании_ХамелеонЦРПТОстатки
		|ИТОГИ
		|	СУММА(КоличествоОстаток)
		|ПО
		|	СерийныйНомер";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаСерийныйНомер = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаСерийныйНомер.Следующий() Цикл
		// Вставить обработку выборки ВыборкаСерийныйНомер
		
		Марка=ВыборкаСерийныйНомер.СерийныйНомер;
		СовпалаМарка=Ложь;
		
		НСтр=Объект.Товары.НайтиСтроки(Новый Структура("КМ",Марка));
		Для Каждого Стр_11 Из НСтр Цикл
			Если Стр_11.КМ=Марка Тогда
				СовпалаМарка=Истина;
				Прервать;
			Конецесли;
		Конеццикла;
		Если СовпалаМарка=Ложь Тогда
			Добав_1=Объект.Товары.Добавить();
			Добав_1.КМ=Стр_11.СерийныйНомер;
			Попытка
				Добав_1.GTIN=Справочники.Продукция_ХамелеонЦРПТ.НайтиПоРеквизиту("GTIN",
				Число(Сред(Добав_1.КМ,3,14)));
			Исключение
			КонецПопытки;
			Добав_1.КМВПрограмме=1;
		Иначе
			Стр_11.КМВПрограмме=Стр_11.КМВПрограмме+1
			
		КонецеслИ;
		
		
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	СвернемЗановоНаСервере()
КонецПроцедуры

