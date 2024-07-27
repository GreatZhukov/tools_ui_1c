Функция СведенияОВнешнейОбработке() Экспорт
	МетаданныеОбработки = Метаданные();
	
    ПараметрыРегистрации = Новый Структура;
    ПараметрыРегистрации.Вставить("Вид", "ДополнительнаяОбработка");
    ПараметрыРегистрации.Вставить("Назначение", Новый Массив);
    ПараметрыРегистрации.Вставить("Наименование", "Портативные универсальные инструменты");
    ПараметрыРегистрации.Вставить("Версия", МетаданныеОбработки.Комментарий);
    ПараметрыРегистрации.Вставить("Информация", "Универсальные инструменты 1С для управляемых форм");
    ПараметрыРегистрации.Вставить("ВерсияБСП", "1.2.1.4");
	ПараметрыРегистрации.Вставить("БезопасныйРежим", Ложь);
	ПараметрыРегистрации.Вставить("ОпределитьНастройкиФормы", Ложь);
	
    Команды = Новый ТаблицаЗначений;
    Команды.Колонки.Добавить("Представление", Новый ОписаниеТипов("Строка"));
    Команды.Колонки.Добавить("Идентификатор", Новый ОписаниеТипов("Строка"));
    Команды.Колонки.Добавить("Использование", Новый ОписаниеТипов("Строка"));
    Команды.Колонки.Добавить("ПоказыватьОповещение", Новый ОписаниеТипов("Булево"));
    Команды.Колонки.Добавить("Модификатор", Новый ОписаниеТипов("Строка"));
    ПараметрыРегистрации.Вставить("Команды", Команды);

    Возврат ПараметрыРегистрации; 
КонецФункции

