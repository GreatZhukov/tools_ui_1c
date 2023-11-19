
#Область ОписаниеПеременных

&НаКлиенте
Перем УИ_РедакторКодаКлиентскиеДанные Экспорт;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Свойство("ЗначениеКопирования") Тогда
		ПрочитатьПоИдентификатору(Параметры.ЗначениеКопирования);
		Идентификатор = "";
	ИначеЕсли Параметры.Свойство("Ключ") Тогда 
		ПрочитатьПоИдентификатору(Параметры.Ключ);
	КонецЕсли;

	// РедакторКода
	УИ_РедакторКодаСервер.ФормаПриСозданииНаСервере(ЭтотОбъект);
	УИ_РедакторКодаСервер.СоздатьЭлементыРедактораКода(ЭтотОбъект, "Алгоритм", Элементы.ПолеТекстАлгоритма);
	// РедакторКода

	УстановитьВидимостьИДоступность();
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// РедакторКода
	УИ_РедакторКодаКлиент.ФормаПриОткрытии(ЭтотОбъект, Неопределено);
   	// РедакторКода
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура НаКлиентеПриИзменении(Элемент)
	УстановитьВидимостьИДоступность();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиКомандФормы


&НаКлиенте
Процедура ЗаписатьИЗакрыть(Команда)
	Отказ = Ложь;
	ЗаписатьНаКлиенте(Отказ);
	Если Не Отказ Тогда
		Закрыть();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура Записать(Команда)
	Отказ = Ложь;
	ЗаписатьНаКлиенте(Отказ);
КонецПроцедуры

&НаКлиенте
Процедура Перечитать(Команда)
	ПрочитатьНаСервере();
	
	УИ_РедакторКодаКлиент.УстановитьТекстРедактора(ЭтотОбъект, "Алгоритм", ТекстАлгоритма, Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьПараметр(Команда)
	ПараметрыФормы = Новый Структура;
	ОткрытьФорму("Обработка.УИ_Алгоритмы2.Форма.ФормаПараметра",
				 ПараметрыФормы,
				 ЭтотОбъект,
				 ,
				 ,
				 ,
				 Новый ОписаниеОповещения("ДобавитьПараметрЗавершение", ЭтотОбъект),
				 РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
КонецПроцедуры


&НаКлиенте
Процедура ИзменитьЗначение(Команда)
	Если Элементы.ТаблицаПараметров.ТекущиеДанные <> Неопределено Тогда
		Оповещение = Новый ОписаниеОповещения("ИзменениеПараметровЗавершение", ЭтотОбъект);
		П = Новый Структура;
		П.Вставить("Ключ", Параметры.Ключ);
		П.Вставить("ИмяПараметра", Элементы.ТаблицаПараметров.ТекущиеДанные.Параметр);
		П.Вставить("ТипПараметра", Элементы.ТаблицаПараметров.ТекущиеДанные.ОписаниеТипа);
		ОткрытьФорму("Справочник.УИ_Алгоритмы.Форма.ФормаПараметра", П, ЭтотОбъект,,,, Оповещение);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПроверкаПараметровПрограммныйИнтерфейс(Команда)
//	Объект.Параметры.Очистить();
//	КодАлгоритма = Объект.КодАлгоритма;
//	мИсключая = УИ_АлгоритмыКлиентСервер.МассивИсключаемыхСимволов();
//	Префикс = "Параметры.";
//	Заполнение = Новый Структура;
//	Пока Найти(КодАлгоритма, Префикс) > 0 Цикл
//		Слово = УИ_АлгоритмыКлиентСервер.ПолучитьПервоеВхождениеСловоБезПрефикса(КодАлгоритма, Префикс, мИсключая);
//		КодАлгоритма = СтрЗаменить(КодАлгоритма, Префикс + Слово, Слово);
//		Попытка
//			Заполнение.Вставить(Слово, Истина);
//		Исключение
//		КонецПопытки;
//	КонецЦикла;
//	Текст = Объект.Текст;
//	Префикс = "$";
//	Пока Найти(КодАлгоритма, Префикс) > 0 Цикл
//		Слово = УИ_АлгоритмыКлиентСервер.ПолучитьПервоеВхождениеСловоБезПрефикса(Текст, Префикс, мИсключая);
//		Текст = СтрЗаменить(Текст, Префикс + Слово, Слово);
//		Попытка
//			Заполнение.Вставить(Слово, Ложь);
//		Исключение
//		КонецПопытки;
//	КонецЦикла;
//
//	АдресХранилища = УИ_АлгоритмыКлиентСервер.ПолучитьПараметры(Объект.Ссылка, Истина);
//
//	ХранимыеПараметры = ПолучитьИзВременногоХранилища(АдресХранилища);
//
//	Для Каждого ЭлементСоответствия Из Заполнение Цикл
//		НоваяСтрока = Объект.Параметры.Добавить();
//		НоваяСтрока.Вход = ЭлементСоответствия.Значение;
//		НоваяСтрока.Имя = ЭлементСоответствия.Ключ;
//		Если НоваяСтрока.Вход И ХранимыеПараметры.Свойство(ЭлементСоответствия.Ключ) Тогда
//			НоваяСтрока.ТипПараметра = ПолучитьСтрокуОписаниеТипа(ХранимыеПараметры[ЭлементСоответствия.Ключ]);
//			НоваяСтрока.ПоУмолчанию = Строка(ХранимыеПараметры[ЭлементСоответствия.Ключ]);
//		КонецЕсли;
//	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьЖурналРегистрации(Команда)
	ПодключитьВнешнююОбработкуНаСервере();
	ПараметрыОткрытия = Новый Структура;
	ПараметрыОткрытия.Вставить("Данные", Идентификатор);
	ПараметрыОткрытия.Вставить("ДатаНачала", НачалоДня(ТекущаяДата()));
	ОткрытьФорму("ВнешняяОбработка.StandardEventLog.Форма", ПараметрыОткрытия);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ПодключитьВнешнююОбработкуНаСервере()
	ВнешниеОбработки.Подключить("v8res://mngbase/StandardEventLog.epf", "StandardEventLog", False);
КонецПроцедуры

&НаСервере
Процедура УстановитьВидимостьИДоступность()
	Элементы.ГруппаПанельСтраниц.Доступность = ЗначениеЗаполнено(Идентификатор);

	Элементы.ФормаОткрытьЖурналРегистрации.Заголовок = " ";

	//Элементы.ГрСервер.Видимость=Не Объект.НаКлиенте;
КонецПроцедуры

#Область Параметры

&НаКлиенте
Процедура ДобавитьПараметрЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ЗаписьОбъекта

&НаКлиенте
Процедура ЗаписатьНаКлиенте(Отказ)
			
	ОбработчикПередЗаписью(Отказ);
	ЗаписатьНаСервере(Отказ);
	ОбработчикПослеЗаписи();
	
	Если Не Отказ Тогда
		Модифицированность = Ложь;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОбработчикПередЗаписью(Отказ)
	ТекстАлгоритма = УИ_РедакторКодаКлиент.ТекстКодаРедактора(ЭтотОбъект, "Алгоритм");
КонецПроцедуры

&НаКлиенте
Процедура ОбработчикПослеЗаписи()
КонецПроцедуры



&НаСервере
Процедура ЗаписатьНаСервере(Отказ)
	ОбработчикПередЗаписьюНаСервере(Отказ);

	Если Не ПроверитьЗаполнение() Тогда
		Отказ = Истина;
		Возврат;
	КонецЕсли;

	
// * Хранилище - Неопределено, Произвольный - 
// * Параметры - Массив из см. НовыйОписаниеПараметраАлгоритма - 
	ДанныеАлгоритмаДляЗаписи = УИ_АлгоритмыКлиентСервер.НовыйОписаниеАлгоритма();
	ЗаполнитьЗначенияСвойств(ДанныеАлгоритмаДляЗаписи, ЭтотОбъект);
//	ДанныеАлгоритмаДляЗаписи.Идентификатор = Идентификатор;
//	ДанныеАлгоритмаДляЗаписи.Наименование = Наименование;
//	ДанныеАлгоритмаДляЗаписи.Код = Код;
//	ДанныеАлгоритмаДляЗаписи.Комментарий = Комментарий;
//	ДанныеАлгоритмаДляЗаписи.Кэшировать = Кэшировать;
//	ДанныеАлгоритмаДляЗаписи.НаКлиенте = НаКлиенте;
//	ДанныеАлгоритмаДляЗаписи.ВыбрасыватьИсключение = ВыбрасыватьИсключение;
//	ДанныеАлгоритмаДляЗаписи.ВыполнятьВТранзакции = ВыполнятьВТранзакции;
//	ДанныеАлгоритмаДляЗаписи.ЗаписыватьОшибкиВЖР = ЗаписыватьОшибкиВЖР;
//	ДанныеАлгоритмаДляЗаписи.ИдентификаторHTTP = ИдентификаторHTTP;
//	ДанныеАлгоритмаДляЗаписи.ИдентификаторРегламентногоЗадания = ИдентификаторРегламентногоЗадания;
//	ДанныеАлгоритмаДляЗаписи.ВыполнятьПоРасписанию = ВыполнятьПоРасписанию;
//	ДанныеАлгоритмаДляЗаписи.ВХранилищеНастроек = ВХранилищеНастроек;
//	ДанныеАлгоритмаДляЗаписи.ТекстАлгоритма = ТекстАлгоритма;
	
	
	УИ_АлгоритмыСервер.ЗаписатьАлгоритм(ДанныеАлгоритмаДляЗаписи, Отказ);
	
	Если Не ЗначениеЗаполнено(Идентификатор) Тогда
		Идентификатор = ДанныеАлгоритмаДляЗаписи.Идентификатор;
	КонецЕсли;
	
	ОбработчикПослеЗаписиНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОбработчикПередЗаписьюНаСервере(Отказ)
КонецПроцедуры

&НаСервере
Процедура ОбработчикПослеЗаписиНаСервере()
	УстановитьВидимостьИДоступность();
	
КонецПроцедуры


#КонецОбласти

#Область ЧтениеОбъекта

&НаСервере
Процедура ПрочитатьНаСервере()
	Если Не ЗначениеЗаполнено(Идентификатор) Тогда
		Возврат;
	КонецЕсли;
	
	ПрочитатьПоИдентификатору(Идентификатор);
	
	Модифицированность = Ложь;
КонецПроцедуры


&НаСервере
Процедура ПрочитатьПоИдентификатору(ИдентификаторАлгоритма)
	ДанныеАлгоритма = УИ_АлгоритмыСервер.ДанныеАлгоритма(ИдентификаторАлгоритма);
	ЗаполнитьЗначенияСвойств(ЭтотОбъект, ДанныеАлгоритма);
КонецПроцедуры

#КонецОбласти

//@skip-warning
&НаКлиенте
Процедура Подключаемый_ПолеРедактораДокументСформирован(Элемент)
	УИ_РедакторКодаКлиент.ПолеРедактораHTMLДокументСформирован(ЭтотОбъект, Элемент);
КонецПроцедуры

//@skip-warning
&НаКлиенте
Процедура Подключаемый_ПолеРедактораПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	УИ_РедакторКодаКлиент.ПолеРедактораHTMLПриНажатии(ЭтотОбъект, Элемент, ДанныеСобытия, СтандартнаяОбработка);
КонецПроцедуры

//@skip-warning
&НаКлиенте
Процедура Подключаемый_РедакторКодаОтложеннаяИнициализацияРедакторов()
	УИ_РедакторКодаКлиент.РедакторКодаОтложеннаяИнициализацияРедакторов(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_РедакторКодаОтложеннаяОбработкаСобытийРедактора() Экспорт
	УИ_РедакторКодаКлиент.ОтложеннаяОбработкаСобытийРедактора(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте 
Процедура Подключаемый_РедакторКодаЗавершениеИнициализации() Экспорт
	УИ_РедакторКодаКлиент.УстановитьТекстРедактора(ЭтотОбъект, "Алгоритм", ТекстАлгоритма, Истина);
КонецПроцедуры


#КонецОбласти
