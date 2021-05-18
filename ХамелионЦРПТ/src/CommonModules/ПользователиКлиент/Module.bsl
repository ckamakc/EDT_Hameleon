///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// См. Пользователи.АвторизованныйПользователь.
Функция АвторизованныйПользователь() Экспорт
	
	Возврат СтандартныеПодсистемыКлиент.ПараметрКлиента("АвторизованныйПользователь");
	
КонецФункции

// См. Пользователи.ТекущийПользователь.
Функция ТекущийПользователь() Экспорт
	
	Возврат ПользователиСлужебныйКлиентСервер.ТекущийПользователь(АвторизованныйПользователь());
	
КонецФункции

// См. Пользователи.ЭтоСеансВнешнегоПользователя.
Функция ЭтоСеансВнешнегоПользователя() Экспорт
	
	Возврат СтандартныеПодсистемыКлиент.ПараметрКлиента("ЭтоСеансВнешнегоПользователя");
	
КонецФункции

#КонецОбласти
