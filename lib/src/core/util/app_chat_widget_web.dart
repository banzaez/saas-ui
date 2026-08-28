import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'dart:js_interop_unsafe'; // Необходимо для использования setProperty

class AppChatWidget {
  static void inject() {
    // 1. Устанавливаем настройки window.replainSettings
    // Мы используем библиотеку 'web', чтобы достучаться до глобального объекта window
    const String chatId = '375b347c-6fac-404a-8ca7-e5c56be1fa23';

    // В современном Dart JS interop (package:web + dart:js_interop),
    // для установки свойств динамически нужно использовать расширение из dart:js_interop_unsafe
    // Также используем .jsify() для корректного преобразования Map в JS-объект
    web.window.setProperty('replainSettings'.toJS, {'id': chatId}.jsify());

    // 2. Создаем элемент <script>
    final web.HTMLScriptElement script =
        web.document.createElement('script') as web.HTMLScriptElement;
    script.async = true;
    script.src = 'https://widget.replain.cc/dist/client.js';

    // 3. Просто добавляем в конец body (самый безопасный вариант для Flutter)
    web.document.body?.appendChild(script);
  }
}
