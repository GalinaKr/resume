# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Certification.none?
  Certification.create([
                         { description: 'Chartered Financial Analyst' },
                         { description: 'Certified Commercial Investment Member' },
                         { description: 'Licensed Salesperson' },
                         { description: 'Licensed Broker' },
                         { custom: true }
                       ])
end

if DegreeOfKinship.none?
  DegreeOfKinship.create([
                           { description_en: 'Mother', description_ru: 'Мать', description_ua: 'Мати'},
                           { description_en: 'Father', description_ru: 'Отец', description_ua: 'Батько' },
                           { description_en: 'Sister', description_ru: 'Сестра', description_ua: 'Сестра' },
                           { description_en: 'Brother', description_ru: 'Брат', description_ua: 'Брат' },
                           { description_en: 'Grand mother', description_ru: 'Бабушка', description_ua: 'Баба' },
                           { description_en: 'Grand father', description_ru: 'Дед', description_ua: 'Дід' },
                           { description_en: 'Husband', description_ru: 'Муж', description_ua: 'Чоловік' },
                           { description_en: 'Wife', description_ru: 'Жена', description_ua: 'Дружина' },
                           { description_en: 'Son', description_ru: 'Сын', description_ua: 'Син' },
                           { description_en: 'Doter', description_ru: 'Дочь', description_ua: 'Дочка' },
                           { description_en: 'Step mother', description_ru: 'Мачеха', description_ua: 'Мачуха' },
                           { description_en: 'Step father', description_ru: 'Отчим', description_ua: 'Відчим' },
                           { description_en: 'Step son', description_ru: 'Пасынок', description_ua: 'Пасинок' },
                           { description_en: 'Step doter', description_ru: 'Падчерица', description_ua: 'Падчерка' },
                           { description_en: 'Adopted', description_ru: 'Усыновлен', description_ua: 'Всиновлений' },
                           { description_en: 'Guardian', description_ru: 'Опекун', description_ua: 'Опікун' }
                         ])
end

if Degree.none?
  Degree.create([
                           { description_en: 'Bachelor of Science', description_ru: 'Бакалавр', description_ua: 'Бакалавр'},
                           { description_en: 'Bachelor of Arts', description_ru: 'Младший бакалавр', description_ua: 'Молодший бакалавр' },
                           { description_en: 'Masters', description_ru: 'Магистр', description_ua: 'Магістр' },
                           { description_en: 'Doctor of Philosophy', description_ru: 'Доктор философии', description_ua: 'Доктор філософії' },
                           { description_en: 'Doctor of Arts', description_ru: 'Доктор искусств', description_ua: 'Доктор мистецтва' },
                           { description_en: 'Doctor of Science', description_ru: 'Доктор наук', description_ua: 'Доктор наук' },
                           { description_en: 'Incomplete higher education', description_ru: 'Неполное высшее', description_ua: 'Неповна вища' },
                           { description_en: 'Incomplete secondary education', description_ru: 'Неполное среднее', description_ua: 'Неповна середня' },
                           { description_en: 'Elementary', description_ru: 'Начальное', description_ua: 'Початкова' },
                           { description_en: 'Vocational education', description_ru: 'Средне-специальное', description_ua: 'Середня-спеціальна' },
                           { description_en: 'Specialist', description_ru: 'Специалист', description_ua: 'Спеціаліст' },
                           { description_en: 'Courses', description_ru: 'Курсы', description_ua: 'Курси' }
                         ])
end

if FormOfEducation.none?
  FormOfEducation.create([
                  { description_en: 'On-the-job', description_ru: 'Без отрыва от производства', description_ua: 'Без відриву від виробництва'},
                  { description_en: 'Out of production', description_ru: 'С отрывом от производства', description_ua: 'З відривом від виробництва' },
                  { description_en: 'Evening', description_ru: 'Вечернее', description_ua: 'Вечірня' },
                  { description_en: 'Daytime', description_ru: 'Дневная', description_ua: 'Денна' },
                  { description_en: 'Daytime for order from ZNPP', description_ru: 'Дневная по заказу ЗАЭС', description_ua: 'Денна по замовленню від ЗАЕС' },
                  { description_en: 'Remote', description_ru: 'Дистанционная', description_ua: 'Дестанційна' },
                  { description_en: 'Externally', description_ru: 'Экстерном', description_ua: 'Екстерном' },
                  { description_en: 'Extramural', description_ru: 'Заочная', description_ua: 'Заочна' },
                  { description_en: 'Part-time', description_ru: 'Очно-заочная', description_ua: 'Очно-заочна' },
                  { description_en: 'Retraining', description_ru: 'Переподготовка', description_ua: 'Перепідготовка' }
                ])
end

if LanguageLevel.none?
  LanguageLevel.create([
                         { description_en: 'Native', description_ru: 'Родной', description_ua: 'Рідний' },
                         { description_en: 'A1 (Beginner)', description_ru: 'A1 (Начальный)', description_ua: 'A1 (Початковий)' },
                         { description_en: 'A2 (Elementary)', description_ru: 'A2 (Элементарный)', description_ua: 'A2 (Елементарний)' },
                         { description_en: 'B1 (Intermediate)', description_ru: 'B1 (Средний)', description_ua: 'B1 (Середній)' },
                         { description_en: 'B2 (Upper-Intermediate)', description_ru: 'B2 (Выше среднего)', description_ua: 'B2 (Вище середнього)' },
                         { description_en: 'C1 (Advanced)', description_ru: 'C1 (Продвинутый)', description_ua: 'C1 (Просунутий)' },
                         { description_en: 'C2 (Proficiency)', description_ru: 'C2 (Отличное знание)', description_ua: 'C2 (Відмінне володіння)' }
                       ])
end
