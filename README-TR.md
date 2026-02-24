# 🔍 MySQL Finder (macOS)

macOS sistemlerde MySQL kurulum dizinini (Path) bulmak bazen tam bir kabusa dönüşebilir. Bu hafif ve akıllı script, MySQL'in izini sürer, yolunu bulur ve saniyeler içinde ilgili klasörü Finder'da sizin için açar.

## ✨ Özellikler

- **Adım Adım Tarama:** Önce en yaygın `/usr` dizinlerini kontrol eder (Hızlı), bulunamazsa tüm diski tarar (Derin).
- **Akıllı Filtreleme:** Sadece "bin" ve "local" gibi anlamlı MySQL dizinlerini hedefler, gereksiz sistem dosyalarını eler.
- **Tek Tıkla Erişim:** Dizin bulunduğu anda otomatik olarak **Finder** penceresinde açılır.
- **Kullanıcı Dostu:** Renkli terminal arayüzü ile süreç hakkında anlık bilgi verir.

## 🚀 Nasıl Kullanılır?

### Yöntem-1: Tek Tıkla Kurulum (En Hızlı)
Terminal'i açın ve aşağıdaki komutu yapıştırın. Bu komut scripti **Masaüstünüze** indirecek ve gerekli izinleri otomatik olarak ayarlayacaktır:

```bash
curl -L -o ~/Desktop/"MySQL Finder.command" "[https://raw.githubusercontent.com/muroshow/MySQLFinder/main/MySQL%20Finder.command](https://raw.githubusercontent.com/muroshow/MySQLFinder/main/MySQL%20Finder.command)" && chmod +x ~/Desktop/"MySQL Finder.command"
