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
