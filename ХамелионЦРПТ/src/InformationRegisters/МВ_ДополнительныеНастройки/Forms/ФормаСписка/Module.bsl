// ФТО:ALNA 22.07.2019 30701

#Область ОбработчикиСобытийФормы

//++ ФТО:SOAL 04.10.2019 32239
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	СписокПолей = РегистрыСведений.МВ_ДополнительныеНастройки.СписокПолейСРежимомПароль();
	Для Каждого ПолеПароль Из СписокПолей Цикл
		РегистрыСведений.МВ_ДополнительныеНастройки.УстановитьУсловноеОформлениеДляПароля(ЭтаФорма, "Значение", "Список.Значение", "Список.Настройка", ПолеПароль);
	КонецЦикла;	
	
КонецПроцедуры
//-- ФТО:SOAL 04.10.2019

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыСписок

&НаСервереБезКонтекста
Процедура СписокПриПолученииДанныхНаСервере(ИмяЭлемента, Настройки, Строки)
		
	Для Каждого Строка Из Строки Цикл
		
		ЭлементФормат = Строка.Значение.Оформление["Значение"].Элементы.Найти("Формат");
		Если ЭлементФормат <> Неопределено Тогда
			
			ЭлементФормат.Значение = РегистрыСведений.МВ_ДополнительныеНастройки.ФорматнаяСтрокаНастройки(Строка.Значение.Данные.Настройка);
			ЭлементФормат.Использование = Истина;
			
		КонецЕсли;
				
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти
