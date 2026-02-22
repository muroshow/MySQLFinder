# 🔍 MySQL Finder (MacOS)

MacOS sistemlerde MySQL kurulum dizinini (Path) bulmak bazen işkenceye dönüşebilir. Bu hafif ve akıllı script, MySQL'in izini sürer, yolunu bulur ve klasörü saniyeler içinde karşınıza getirir.

## ✨ Özellikler

- **Aşamalı Tarama:** Önce en yaygın `/usr` dizinlerine bakar (Hızlı), bulamazsa tüm diski tarar (Derin).
- **Akıllı Filtreleme:** Sadece "bin" ve "local" gibi anlamlı MySQL dizinlerini hedefler, çöp sonuçları eler.
- **Tek Tıkla Erişim:** Bulduğu konumu otomatik olarak **Finder** üzerinde açar.
- **Kullanıcı Dostu:** Renkli terminal arayüzü ile süreç hakkında anlık bilgi verir.

## 🚀 Nasıl Kullanılır?

1. Bu repository'deki `MySQL Finder.command` dosyasını indirin.
2. Dosyayı masaüstüne veya istediğiniz bir klasöre taşıyın.
3. Scriptin çalışması için terminalden şu izni verin (Sadece bir kez):
   ```bash
   chmod +x "MySQL Finder.command"
