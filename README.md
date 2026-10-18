# Генератор форм (Ruby)

[![hexlet-check](https://github.com/kicha3007-boop/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/kicha3007-boop/rails-project-63/actions)
[![CI](https://github.com/kicha3007-boop/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/kicha3007-boop/rails-project-63/actions/workflows/ci.yml)

Библиотека, с помощью которой удобно создавать формы в шаблонах сайтов. Каждое поле формы описывается одной строкой, и библиотека сама подставляет тег, имя поля и его значение из объекта.

Учебный проект Хекслета: https://ru.hexlet.io/programs/rails

## Установка

```bash
git clone https://github.com/kicha3007-boop/rails-project-63.git
cd rails-project-63
make install
```

## Использование

```ruby
require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user, url: '/users' do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit 'Wow'
end

# <form action="/users" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="rob" class="user-input">
#   <label for="job">Job</label>
#   <textarea name="job" cols="50" rows="50">hexlet</textarea>
#   <input type="submit" value="Wow">
# </form>
```

Без `url` форма отправляется на `#`, без аргумента у `submit` кнопка называется `Save`. Поле, которого нет в объекте, вызывает `NoMethodError`.

Отдельно доступна генерация тегов:

```ruby
HexletCode::Tag.build('img', src: 'path/to/image') # <img src="path/to/image">
HexletCode::Tag.build('label', for: 'email') { 'Email' } # <label for="email">Email</label>
```

## Разработка

```bash
make test     # тесты
make lint     # rubocop
make console  # irb с подключённой библиотекой
```

## Устройство

`FormBuilder` собирает внутреннее представление формы: опции формы, список полей (`Inputs::StringInput`, `Inputs::TextInput`) и кнопку. `FormRenderer` превращает это представление в HTML. Новый тип поля — это класс в `lib/hexlet_code/inputs/` и строка в `FormBuilder::INPUT_TYPES`.

<details>
<summary>Автоматические тесты Хекслета</summary>

Тесты запускаются на каждый коммит. За запуск отвечает файл `.github/workflows/hexlet-check.yml` — не удаляйте и не переименовывайте ни его, ни репозиторий.

</details>
