//
//  DataManager.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 14.06.2023.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let nameCoffee = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    let nameTrening = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    let nameDevice = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    let nameBravillorProduct = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    
    let priceForCoffee = [599, 699, 799, 899, 1099, 1199]
    let priceForTrening = [299, 399, 599, 499]
    let priceForDevices = [299, 299, 626, 626]
    let priceForBravillor = [1599, 1899, 2099, 2599, 2999]
    
    let imageCoffee = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    let imageTrening = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    let imageDevice = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    let imageBravillorProduct = ["aaa", "aaa", "aaa", "aaaa", "aaaa", "aaaa", "aaaa"]
    
    let descriptionOfCoffee = [
        """
        iPhone 12
        Характеристика:
        Поддержка 5G
        Чип A14 Bionic
        Дисплей Super Retina XDR1:  6,1
        Цвет: Фиолетовый
        Память: 512 ГБ
        4‑ядерный графический процессор
        16‑ядерная система Neural Engine
        Дисплей: Super Retina XDR
        Задняя камера: 2
        Фронтальная камера: 1
        """,
        """
        iPhone 12 Pro
        Характеристика:
        Поддержка 5G
        Чип A14 Bionic
        Дисплей Super Retina XDR1:  6,1
        Цвет: Графитовый
        Память: 512 ГБ
        4‑ядерный графический процессор
        16‑ядерная система Neural Engine
        Дисплей: Super Retina XDR
        Задняя камера: 3
        Фронтальная камера: 1
        """,
        """
        iPhone 12 Pro Max
        Характеристика:
        Поддержка 5G
        Чип A14 Bionic
        Дисплей Super Retina XDR1:  6,7
        Цвет: «Тихоокеанский синий»
        Память: 512 ГБ
        4‑ядерный графический процессор
        16‑ядерная система Neural Engine
        Дисплей: Super Retina XDR
        Задняя камера: 3
        Фронтальная камера: 1
        """,
        """
        iPhone 13
        Характеристика:
        Поддержка 5G
        Дисплей Super Retina XDR1:  6,1
        Цвет: Розовый
        Дисплей: Super Retina XDR
        Чип A15 Bionic
        Память:  512 ГБ
        6‑ядерный процессор
        4‑ядерный графический процессор
        16‑ядерная система Neural Engine
        Задняя камера: 2
        Фронтальная камера: 1
        """,
        """
iPhone 13 Pro
Характеристика:
Поддержка 5G
Дисплей Super Retina XDR1:  6,1
Цвет: Золотой
Дисплей: Super Retina XDR
Чип A15 Bionic
Память:  1 т
6‑ядерный процессор
4‑ядерный графический процессор
16‑ядерная система Neural Engine
Задняя камера: 3
Фронтальная камера: 1
""",
        """
iPhone 13 Pro Max
Характеристика:
Поддержка 5G
Дисплей Super Retina XDR1:  6,1
Цвет: Небесно-голубой
Дисплей: Super Retina XDR
Чип A15 Bionic
Память: 1 т
6‑ядерный процессор
4‑ядерный графический процессор
16‑ядерная система Neural Engine
Задняя камера: 3
Фронтальная камера: 1
"""
    ]
    
    let descriptionOfTrenings = [
        """
iPad Pro 12,9'' (третье поколение)
Характеристика:
Цвет: Серебристый
Память: 512
Модуль: Neural Engine
ID чипа: A12X (T8027)
Оперативная память: 6144
Диагональ (дюймов): 12,9
Поддержка сетей СDMA
Задняя камера: 1
Фронтальная камера: 1
""",
        """
iPad Pro 11'' (второе поколение)
Характеристика:
Цвет: Серый космос
Память: 512
Модуль: Neural Engine
ID чипа: A12Z (T8028)
Оперативная память: 6144
Диагональ (дюймов): 11
Поддержка сетей СDMA
Задняя камера: 2
Фронтальная камера: 1
""",
        """
iPad Pro 12,9'' (третье поколение)
Характеристика:
Цвет: Серый космос
Память: 512
Модуль: Neural Engine
ID чипа: A12Z (T8028)
Оперативная память: 6144
Диагональ (дюймов): 12,9
Поддержка сетей СDMA
Задняя камера: 2
Фронтальная камера: 1
""",
        """
iPad Air 4
Характеристика:
Цвет: Розовое золото
Память: 512
Модуль: Neural Engine
ID чипа: A14 (T8101)
Оперативная память: 3072
Диагональ (дюймов): 10,9
Поддержка сетей СDMA
Задняя камера: 1
Фронтальная камера: 1
"""
    ]
    
    let descriptionOfDevices = [
        """
    Apple Watch Series 6 - 40mm
    Характеристика:
    Экран: AMOLED, 1,78″, 368×448 (326 ppi), с функцией AlwaysOn
    Материал корпуса: титан
    SoC (CPU): Apple S6, 2 ядра
    Защита: 5 атм (погружение на глубину до 50 метров)
    Операционная система: watchOS 7.0 (доступно обновление до watchOS 8)
    Емкость встроенного накопителя: 32 ГБ
    """,
        """
        Apple Watch Series 6 - 44mm
        Характеристика:
        Экран: AMOLED, 1,78″, 368×448 (326 ppi), с функцией AlwaysOn
        Материал корпуса: титан
        SoC (CPU): Apple S6, 2 ядра
        Защита: 5 атм (погружение на глубину до 50 метров)
        Операционная система: watchOS 7.0 (доступно обновление до watchOS 8)
        Емкость встроенного накопителя: 32 ГБ
    """,
        """
            Apple Watch Series 7 - 41mm
            Характеристика:
            Экран: LTPO OLED, 1,69″, 352×430 (326 ppi), с функцией AlwaysOn
            Материал корпуса: титан
            SoC (CPU): Apple S7, 2 ядра
            Защита: 5 атм (погружение на глубину до 50 метров)
            Операционная система: watchOS 8.0
            Емкость встроенного накопителя: 32 ГБ
    """,
        """
               "Apple Watch Series 7 - 45mm"
                Характеристика:
                Экран: LTPO OLED, 1,9″, 396×484 (326 ppi), с функцией AlwaysOn
                Материал корпуса: титан
                SoC (CPU): Apple S7, 2 ядра
                Защита: 5 атм (погружение на глубину до 50 метров)
                Операционная система: watchOS 8.0
                Емкость встроенного накопителя: 32 ГБ
    """
    ]
    
    
    let descriptionOfBravillor = [
    """
MacBook Pro (13 дюймов, 2020 г., четыре порта Thunderbolt 3)
Технические характеристики:
Цвета: серебристый
Дисплей: Дисплей Retina
Процессор: 2,0 ГГц, 4‑ядерный Intel Core i5 10‑го поколения
Накопитель: SSD‑накопи­тель 1 ТБ
Память: 16 ГБ
""",
    """
MacBook Pro (13 дюймов, 2020 г., два порта Thunderbolt 3)
Технические характеристики:
Цвета: серебристый
Дисплей: Дисплей Retina
Процессор: 1,4 ГГц, 4‑ядерный Intel Core i5 8‑го поколения
Накопитель: SSD‑накопи­тель 256 ГБ
Память: 8 ГБ встроенной памяти LPDDR3 2133 МГц
""",
    """
MacBook Pro (13 дюймов, M1, 2020 г.)
Технические характеристики:
Цвет: Серый космос
Дисплей: Retina
Чип: Apple M1
Память: 8 ГБ
Накопители: SSD‑накопитель 256 ГБ
""",
    """
MacBook Pro (16 дюймов, 2021 г.)
Технические характеристики:
Цвет: «Серый космос»
Дисплей: Liquid Retina XDR
Чип: Apple M1 Max
Дисплей: Дисплей Liquid Retina XDR
Память: Apple M1 Max
64 ГБ объединённой памяти
Накопители: Apple M1 Max
SSD‑накопитель 1 ТБ
Частота обновления:
Технология ProMotion с адаптивной частотой обновления до 120 Гц
""",
    """
MacBook Pro (14 дюймов, 2021 г.)
Технические характеристики:
Цвета: серебристый
Дисплей Liquid Retina XDR
Чип: Apple M1 Pro
Дисплей: Liquid Retina XDR
Память: Apple M1 Pro
16 ГБ объединённой памяти
Накопители: Apple M1 Pro
SSD‑накопитель 512 ГБ
Частота обновления:
Технология ProMotion с адаптивной частотой обновления до 120 Гц
"""
    ]
    
    private init() {}
    
    
}


