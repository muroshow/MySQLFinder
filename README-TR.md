# 🔍 macOS MySQL Directory Finder

macOS sistemlerde MySQL kurulum dizinini (Path) bulmak bazen tam bir kabusa dönüşebilir. Bu hafif ve akıllı script, MySQL'in izini sürer, yolunu bulur ve saniyeler içinde ilgili klasörü Finder'da sizin için açar.

## ✨ Özellikler

- **🌍 Otomatik Dil Desteği:** Sistem dilinizi algılar; Türkçe sistemlerde Türkçe, diğer tüm dillerde otomatik olarak İngilizce çalışır.
- **🔍 Adım Adım Tarama:** Önce en yaygın `/usr` dizinlerini kontrol eder (Hızlı), bulunamazsa tüm diski tarar (Derin).
- **🛡️ Akıllı Filtreleme:** Sadece "bin" ve "local" gibi anlamlı MySQL dizinlerini hedefler, gereksiz dosyaları eler.
- **📂 Tek Tıkla Erişim:** Dizin bulunduğu anda otomatik olarak **Finder** penceresinde açılır.
- **🎨 Kullanıcı Dostu:** Renkli terminal arayüzü ile süreç hakkında anlık ve estetik bilgi verir.

---

## 🚀 Nasıl Kullanılır?

### Yöntem-1: Tek Tıkla Kurulum (En Hızlı)
Terminal'i açın ve aşağıdaki komutu yapıştırın. Bu komut scripti **Masaüstünüze** indirecek ve gerekli izinleri otomatik olarak ayarlayacaktır:

```bash
curl -L -o ~/Desktop/"macOs MySQL Directory Finder.command" "[https://raw.githubusercontent.com/muroshow/MySQLFinder/main/macOs%20MySQL%20Directory%20Finder.command](https://raw.githubusercontent.com/muroshow/MySQLFinder/main/macOs%20MySQL%20Directory%20Finder.command)" && chmod +x ~/Desktop/"macOs MySQL Directory Finder.command"
