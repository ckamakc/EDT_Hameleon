// ФТО:ALNA 22.07.2019 30701

#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	НастроитьОформлениеНаСервере();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура НастройкаПриИзменении(Элемент)
	
	НастроитьОформлениеНаСервере();

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура НастроитьОформлениеНаСервере()
	
	НастройкаОбщая = ОбщегоНазначения.ЗначениеРеквизитаОбъекта(Запись.Настройка, "Общая");
	НужнаОрганизация = (НастройкаОбщая = Ложь); //может быть NULL
	Элементы.Организация.АвтоОтметкаНезаполненного = НужнаОрганизация;
	Если НЕ НужнаОрганизация И Элементы.Организация.ОтметкаНезаполненного Тогда
		Элементы.Организация.ОтметкаНезаполненного = Ложь;
	КонецЕсли;
	
	//++ ФТО:SOAL 03.10.2019 32239
	Элементы.Значение.РежимПароля = РегистрыСведений.МВ_ДополнительныеНастройки.ВключатьРежимПароляДляНастройки(Запись.Настройка); 
	//-- ФТО:SOAL 03.10.2019 
	
КонецПроцедуры

#КонецОбласти
