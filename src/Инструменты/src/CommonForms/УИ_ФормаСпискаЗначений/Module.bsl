


#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	СписокЗначенияИсточник = Новый СписокЗначений;
	
	Если Параметры.Свойство("ХранилищеКонтейнераЗначения") Тогда
		ВозвратХранилищаДляКонтейнераЗначения = Истина;
		//@skip-check unknown-form-parameter-access
		ХранилищеКонтейнтейнера = Параметры.ХранилищеКонтейнераЗначения;//см. УИ_ОбщегоНазначенияКлиентСервер.НовыйХранилищеЗначенияТипаСписокЗначений
		
		Если ХранилищеКонтейнтейнера <> Неопределено Тогда
			Если ЗначениеЗаполнено(ХранилищеКонтейнтейнера.Значение) Тогда
				СписокЗначенияИсточник = ЗначениеИзСтрокиВнутр(ХранилищеКонтейнтейнера.Значение);
			КонецЕсли;
			
		КонецЕсли;
	ИначеЕсли Параметры.Свойство("ХранилищеКонтейнераЗначенияМассива") Тогда 
		ВозвратХранилищаДляКонтейнераЗначения = Истина;
		ЭтоМассив = Истина;
		
		//@skip-check unknown-form-parameter-access
		ХранилищеКонтейнтейнера = Параметры.ХранилищеКонтейнераЗначенияМассива;//см. УИ_ОбщегоНазначенияКлиентСервер.НовыйХранилищеЗначенияТипаМассив
		
		Если ХранилищеКонтейнтейнера <> Неопределено Тогда
			Если ЗначениеЗаполнено(ХранилищеКонтейнтейнера.Значение) Тогда
				МассивЗначенияИсточник = ЗначениеИзСтрокиВнутр(ХранилищеКонтейнтейнера.Значение);
				СписокЗначенияИсточник.ЗагрузитьЗначения(МассивЗначенияИсточник);
			КонецЕсли;
			
		КонецЕсли;
		
	ИначеЕсли Параметры.Свойство("Список") Тогда 
		//@skip-check unknown-form-parameter-access
		СписокЗначенияИсточник = Параметры.Список;
	КонецЕсли;
	
	Если ЭтоМассив Тогда
		Элементы.ТаблицаСпискаПометка.Видимость = Ложь;
		Элементы.ТаблицаСпискаПредставление.Видимость = Ложь;
		Заголовок = "Редактор массива";
	КонецЕсли;
	
	ПрочитатьСписокЗначенийВТаблицу(СписокЗначенияИсточник);
КонецПроцедуры



#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ТипЗначенийСпискаПриИзменении(Элемент)
	ТипЗначенияСпискаПриИзмененииНаСервере();
КонецПроцедуры

// Код процедур и функций
&НаКлиенте
Процедура ТипЗначенийСпискаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;

	УИ_ОбщегоНазначенияКлиент.РедактироватьТип(ТипЗначенийСписка,
											   1,
											   СтандартнаяОбработка,
											   ЭтотОбъект,
											   Новый ОписаниеОповещения("ТипЗначенийСпискаНачалоВыбораЗавершение",
		ЭтотОбъект));
КонецПроцедуры


#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТаблицаСписка

&НаКлиенте
Процедура ТаблицаСпискаЗначениеНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ТекДанные = Элементы.ТаблицаСписка.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		ВозвраТ;
	КонецЕсли;
	
	ПараметрыОбработчика = УИ_ОбщегоНазначенияКлиент.НовыйПараметрыОбработчикаСобытияНачалоВыбораЗначения(ЭтотОбъект,
																										  Элемент,
																										  "Значение");
	ПараметрыОбработчика.ДоступенКонтейнер = Истина;
	ПараметрыОбработчика.Значение = ТекДанные.Значение;
	ПараметрыОбработчика.СтруктураХраненияЗначения = ТекДанные;
	ПараметрыОбработчика.НаборТипов = УИ_ОбщегоНазначенияКлиентСервер.ВсеНаборыТиповДляРедактирования();
	ПараметрыОбработчика.ТекущееОписаниеТиповЗначения = ТипЗначенийСписка;

	УИ_ОбщегоНазначенияКлиент.ПолеФормыОбработчикНачалоВыбораЗначения(ПараметрыОбработчика, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаСпискаЗначениеПриИзменении(Элемент)
	ТекДанные = Элементы.ТаблицаСписка.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ПараметрыОбработчика = УИ_ОбщегоНазначенияКлиент.НовыйПараметрыОбработчикаСобытияПриИзменении(ЭтотОбъект,
																								  Элемент,
																								  "Значение");
	ПараметрыОбработчика.ДоступенКонтейнер = Истина;
	ПараметрыОбработчика.СтруктураХраненияЗначения = ТекДанные;

	УИ_ОбщегоНазначенияКлиент.ПолеФормыОбработчикПриИзменении(ПараметрыОбработчика);
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаСпискаЗначениеОчистка(Элемент, СтандартнаяОбработка)
	ТекДанные = Элементы.ТаблицаСписка.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыОбработчика = УИ_ОбщегоНазначенияКлиент.НовыйПараметрыОбработчикаСобытияОчистка(ЭтотОбъект,
																							 Элемент,
																							 "Значение");
	ПараметрыОбработчика.ДоступенКонтейнер = Истина;
	ПараметрыОбработчика.СтруктураХраненияЗначения = ТекДанные;
	ПараметрыОбработчика.ТекущееОписаниеТиповЗначения = ТипЗначенийСписка;

	УИ_ОбщегоНазначенияКлиент.ПолеФормыОбработчикОчистка(ПараметрыОбработчика, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаСпискаКартинкаНажатие(Элемент, СтандартнаяОбработка)
	ТекДанные = Элементы.ТаблицаСписка.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ТаблицаСпискаКартинкаНачатьВыбор(Элементы.ТаблицаСписка.ТекущаяСтрока);
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаСпискаВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	Если Поле.Имя <> "ТаблицаСпискаКартинка" Тогда
		Возврат;
	КонецЕсли;
	СтандартнаяОбработка = Ложь;
	
	ТаблицаСпискаКартинкаНачатьВыбор(ВыбраннаяСтрока);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы


&НаКлиенте
Процедура Применить(Команда)
	Закрыть(ВозвращаемоеЗначениеФормы());
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ТаблицаСпискаКартинкаНачатьВыбор(ИдентификаторСтроки)
	ТекДанные = ТаблицаСписка.НайтиПоИдентификатору(ИдентификаторСтроки);
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыОповещения = Новый Структура;
	ПараметрыОповещения.Вставить("ИдентификаторСтроки", ИдентификаторСтроки);

	УИ_ОбщегоНазначенияКлиент.РедактироватьКартинку(ТекДанные.Картинка,
													Новый ОписаниеОповещения("ТаблицаСпискаКартинкаНажатиеЗавершение",
		ЭтотОбъект, ПараметрыОповещения));
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаСпискаКартинкаНажатиеЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		ВозвраТ;
	КонецЕсли;
	
	СтрокаТЗ = ТаблицаСписка.НайтиПоИдентификатору(ДополнительныеПараметры.ИдентификаторСтроки);
	Если СтрокаТЗ = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	СтрокаТЗ.Картинка = Результат;
КонецПроцедуры

&НаСервере
Функция ОтредактированныйСписок()
	СтруктураХраненияЗначения = УИ_ОбщегоНазначенияКлиентСервер.НовыйСтруктураХраненияРеквизитаНаФормеСКонейнером("Значение");

	Список = Новый СписокЗначений();
	Список.ТипЗначения = ТипЗначенийСписка;
	
	Для Каждого СтрокаТаблицы Из ТаблицаСписка Цикл
		Список.Добавить(УИ_ОбщегоНазначенияКлиентСервер.ЗначениеПоляСКонтейнеромЗначения(СтрокаТаблицы,
																						 СтруктураХраненияЗначения),
						СтрокаТаблицы.Представление,
						СтрокаТаблицы.Пометка,
						СтрокаТаблицы.Картинка);
	КонецЦикла;
	
	Возврат Список;	
КонецФункции

&НаСервере
Функция ВозвращаемоеЗначениеФормы()
	Список = ОтредактированныйСписок();
	
	Если ВозвратХранилищаДляКонтейнераЗначения Тогда
		Если ЭтоМассив Тогда
			Возврат УИ_ОбщегоНазначения.ЗначениеХранилищаКонтейнераМассиваИзСпискаЗначений(Список);
		Иначе
			Возврат УИ_ОбщегоНазначения.ЗначениеХранилищаКонтейнераСпискаЗначений(Список);
		КонецЕсли;
	Иначе
		Если ЭтоМассив Тогда
			Возврат Список.ВыгрузитьЗначения();
		Иначе
			Возврат Список;
		КонецЕсли;
	КонецЕсли;
КонецФункции

// Прочитать список значений в таблицу.
// 
// Параметры:
//  СписокИсточник - СписокЗначений из Произвольный- Список источник
&НаСервере
Процедура ПрочитатьСписокЗначенийВТаблицу(СписокИсточник)
	СтруктураХраненияЗначения = УИ_ОбщегоНазначенияКлиентСервер.НовыйСтруктураХраненияРеквизитаНаФормеСКонейнером("Значение");

	ТипЗначенийСписка = СписокИсточник.ТипЗначения;
		
	ТаблицаСписка.Очистить();
	Для Каждого ЭлементСписка Из СписокИсточник Цикл
		НоваяСтрока = ТаблицаСписка.Добавить();
		НоваяСтрока.Пометка = ЭлементСписка.Пометка;
		НоваяСтрока.Представление = ЭлементСписка.Представление;
		НоваяСтрока.Картинка = ЭлементСписка.Картинка;

		УИ_ОбщегоНазначенияКлиентСервер.УстановитьЗначениеПоляСКонтейнером(НоваяСтрока,
																		   СтруктураХраненияЗначения,
																		   ЭлементСписка.Значение);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ТипЗначенийСпискаНачалоВыбораЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ТипЗначенийСписка = Результат;

	ТипЗначенияСпискаПриИзмененииНаСервере();
КонецПроцедуры

&НаСервере
Процедура ТипЗначенияСпискаПриИзмененииНаСервере()
	ПривестиЗначениеСпискаКТипуЗначенийСписка();
КонецПроцедуры

&НаСервере
Процедура ПривестиЗначениеСпискаКТипуЗначенийСписка() 
	СтруктураХраненияЗначения = УИ_ОбщегоНазначенияКлиентСервер.НовыйСтруктураХраненияРеквизитаНаФормеСКонейнером("Значение");
	Для Каждого СтрокаТЗ Из ТаблицаСписка Цикл
		ЗначениеПоля = УИ_ОбщегоНазначенияКлиентСервер.ЗначениеПоляСКонтейнеромЗначения(СтрокаТЗ,
																						СтруктураХраненияЗначения);
		НовоеЗначениеПоля = ТипЗначенийСписка.ПривестиЗначение(ЗначениеПоля);

		Если ЗначениеПоля <> НовоеЗначениеПоля Или ТипЗнч(ЗначениеПоля) <> ТипЗнч(НовоеЗначениеПоля) Тогда
			УИ_ОбщегоНазначенияКлиентСервер.УстановитьЗначениеПоляСКонтейнером(СтрокаТЗ,
																			   СтруктураХраненияЗначения,
																			   НовоеЗначениеПоля);
		КонецЕсли;

	КонецЦикла;
КонецПроцедуры
#КонецОбласти
