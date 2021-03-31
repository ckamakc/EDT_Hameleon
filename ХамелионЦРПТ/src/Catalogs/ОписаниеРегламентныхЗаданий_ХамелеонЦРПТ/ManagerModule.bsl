Процедура ОбновлениеСтатусов() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.Вспомогательная.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновлениеСтатусов");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
КонецПроцедуры


Процедура ОбновлениеЗагрузкиЧековЗаВчера() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаЧековККМизЦРПТзаВЧЕРА.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаЧековККМизЦРПТзаВЧЕРА");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
КонецПроцедуры

Процедура ОбновлениеПриемки() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаПриемки.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаПриемки");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
КонецПроцедуры

Процедура ОбновитьПредопределенныеРегламент() Экспорт
	ОбновлениеСтатусов();
	ОбновлениеПриемки();
	
КонецПроцедуры

Процедура ОбновлениеСтатусовВсехПользователей() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновлениеСтатусовПоВсем.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновлениеСтатусовПоВсем");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаВсехПриходов.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаВсехПриходов");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьСтатусыПоВемОрганизациямАгрегации.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновитьСтатусыПоВемОрганизациямАгрегации");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьСтатусыПоВемОрганизациямВводВОборот.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновитьСтатусыПоВемОрганизациямВводВОборот");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьСтатусыПоВемОрганизациямПриемка.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновитьСтатусыПоВемОрганизациямПриемка");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаВсехПриходовДиадок.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаВсехПриходовДиадок");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаВсехПриходовСБИС.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаВсехПриходовСБИС");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаВсехПриходовТакском.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаВсехПриходовТакском");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ЗагрузкаВсехПриходовЭДОЛайт.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ЗагрузкаВсехПриходовЭДОЛайт");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
		
КонецПроцедуры


Процедура ПринятьВсеПриходы() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПринятьПриходыПоВсемОрганизациям.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ПринятьПриходыПоВсемОрганизациям");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
КонецПроцедуры


Процедура ОбновитьСтатусыВсехПоСервере() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьСтатусыПоВсемОрганизациямАгрегацииНаСервере.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновитьСтатусыПоВсемОрганизациямАгрегацииНаСервере");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Ложь;
	СпрОб1.Записать();
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьСтатусыПоВсемОрганизациямВводВОборотНаСервере.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновитьСтатусыПоВсемОрганизациямВводВОборотНаСервере");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Ложь;
	СпрОб1.Записать();
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьСтатусыПоВсемОрганизациямПриемкаНаСервере.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОбновитьСтатусыПоВсемОрганизациямПриемкаНаСервере");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Ложь;
	СпрОб1.Записать();
	
	
КонецПроцедуры

Процедура СоздатьАгрегацииИОтправитьВЦРПТ() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.СоздатьАгрегацииИОтправитьВЦРПТ.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("СоздатьАгрегацииИОтправитьВЦРПТ");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Ложь;
	СпрОб1.Записать();
	
КонецПроцедуры

// ++ Кириченко 28.09.2020
Процедура МВ_АвтоматическаяОтправкаЦРПТ() Экспорт
	
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.МВ_АвтоматическаяОтправкаЦРПТ.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("МВ_АвтоматическаяОтправкаЦРПТ");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Истина;
	СпрОб1.Записать();
	
КонецПроцедуры// -- Кириченко 28.09.2020

Процедура ОтправитьАгрегацииИОбновитьСтатусы() Экспорт
	СпрОб1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОтправитьАгрегацииИОбновитьСтатусы.ПолучитьОбъект();
	Макет1=Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ПолучитьМакет("ОтправитьАгрегацииИОбновитьСтатусы");
	СпрОб1.Алгоритм=Макет1.ПолучитьТекст();
	СпрОб1.ВыполнитьНаКлиенте=Ложь;
	СпрОб1.Записать();
	
КонецПроцедуры