# Treasure Chest 3D – Godot Game

Проект за предметот Визуелно програмирање  
Автор: Ѓорге Проданов

## 1. Опис на апликацијата

Оваа 3D игра симулира лов на богатство во природна околина. Играчот, од прво лице, се движи низ теренот со цел да собере 10 златни монети, 4 гумени патки или 2 ковчези со злато пред да истече времето. Играта комбинира едноставна механика, визуелно пријатен дизајн и основна интерактивност.
Целиот процес е подетално опишан во приложениот PDF документ.

## 2. Упатство за користење

- Користете W/A/S/D за движење и глувче за ротирање на камерата.
- Целта е да соберете доволно богатства (монети, патки или ковчези).
- При победа, се прикажува порака и играта завршува.
- Ако времето истече пред да се собере доволно богатство, играчот губи.

## 3. Структура на сцената

Node3D
<br>
├── WorldEnvironment
<br>
├── DirectionalLight3D
<br>
├── Terrain3D
<br>
├── BasicFpsPlayer
<br>
│ ├── Head
<br>
│ │ └── Camera3D
<br>
│ └── TreasureDetector (Area3D)
<br>
├── Coins / Duckies / Chests
<br>
│ ├── Area3D + Mesh + Collision
<br>
├── CanvasLayer
<br>
│ ├── ScoreLabel
<br>
│ └── TimerLabel
<br>
└── GameTimer

## 4. Ресурси и средства

### 4.1 Модели и објекти
- Terrain3D: [Terrain Plugin](https://github.com/TokisanGames/Terrain3D)
- Играч: [Basic FPS Player](https://godotengine.org/asset-library/asset/2439)
- Scatter Items: [Proton Scatter](https://godotengine.org/asset-library/asset/1866)
- 3D објекти: монети, патки, ковчези, печурки, камења

### 4.2 UI
- ScoreLabel: Приказ на моментален број на поени
- TimerLabel: Приказ на преостанато време

## 5. Имплементациски детали

### 5.1 Креирање на проект
- Нов Godot проект, root Node3D

### 5.2 Поставување на терен
- Terrain3D node со прилагодена топографија

### 5.3 Осветлување и околина
- DirectionalLight3D + WorldEnvironment

### 5.4 Играч
- BasicFpsPlayer со `Camera3D` и контроли

### 5.5 Богатства
- Монети, гумени патки, ковчези – секој како засебен `Area3D`
- Анимации за ротирање и колизии

### 5.6 Природни елементи
- Scatter Items за трева, камења, печурки

### 5.7 UI
- CanvasLayer со ScoreLabel и TimerLabel

### 5.8 Тајмер
- GameTimer со countdown логика

### 5.9 Логика за победа/пораз
- Сигнал `body_entered`, зголемување на поени, проверка за победа
### 5.10 Пример од логиката на играта

- Оваа функција се повикува кога играчот ќе собере предмет (монета, патка, ковчег). Се зголемува бројот на поени, се ажурира екранот и ако се соберат доволно поени, играта завршува по кратко доцнење:

  ```gdscript
  func _on_body_entered(body: Node3D) -> void:
  	Global.coins += 1
  	score_label.text = "Score: " + str(Global.coins)
  	queue_free()
  
  	if Global.coins >= NUM_COINS_TO_WIN:
  		score_label.add_theme_font_size_override("font_size", 50)
  		score_label.add_theme_color_override("font_color", Color.RED)
  		score_label.position = Vector2(300, 250)
  		
  		score_label.text = "You win!! Final Score: " + str(Global.coins)
  		await get_tree().create_timer(3.0).timeout  
  		Global.coins = 0
  		get_tree().quit()


## 6. Кориснички интерфејс

- ScoreLabel: се ажурира при собирање на богатство
- TimerLabel: прикажува време за преостаната игра
- Победа: порака + пауза + излез
- Пораз: истекување на време = крај

## 7. Screenshots

![image](https://github.com/user-attachments/assets/aaf5e047-3f01-4578-a881-cc6a416be5d0)
![image](https://github.com/user-attachments/assets/771132c1-d16d-4403-b889-ce3d96315721)


## 8. Резиме и идни задачи

Проектот покажува успешна имплементација на едноставна 3D игра во Godot со ротирачки предмети, FPS контроли и основна логика за победа.  
Во иднина би можело да се додаде:
- Непријатели / животна опасност
- Звуци и позадинска музика
- Повеќе нивоа
- Случајно генерирани локации на предмети

## 9. Инсталација и извршување

Клонирај го гит репозиториумот.  
Отвори ја апликацијата на Godot (најпрво мора да ти е инсталирана: <https://godotengine.org/download/archive/4.3-stable>)  
Избери го фолдерот каде што го клонираше репото и притисни F5 (или Run Project) за да ја стартуваш играта.

---
