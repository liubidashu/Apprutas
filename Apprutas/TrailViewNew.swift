//
//  TrailViewNew.swift
//  Apprutas
//
//  Created by Дарья Любивая on 14.06.2025.
//

import SwiftUI

// MARK: - Цветовая палитра
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}

struct AppColors {
    static let primaryText = Color(hex: "000000")
    static let accent = Color(hex: "BCD232")
    static let background = Color(hex: "FFFFFF")
    static let secondaryText = Color(hex: "9C9C9C")
    static let divider = Color(hex: "9C9C9C").opacity(0.5)
}

// MARK: - Главное View
struct TrailViewNew: View {
    @State private var newRoute = NewRoute()
    @State private var showingAlert = false
    @State private var showImagePicker = false
    @State private var selectedPointIndex: Int = 0

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Заголовок "создание"
                    Text("создание")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(AppColors.primaryText)
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
                        .padding(.bottom, 12) // Увеличен отступ снизу
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Основные поля
                    FloatingLabelInputField(
                        title: "название",
                        placeholder: "название маршрута",
                        text: $newRoute.title,
                        isRequired: true,
                        maxLength: 56
                    )
                    FloatingLabelInputField(
                        title: "описание",
                        placeholder: "описание маршрута",
                        text: $newRoute.description,
                        isRequired: true,
                        maxLength: 170
                    )
                    FloatingLabelInputField(
                        title: "локация",
                        placeholder: "локация маршрута",
                        text: $newRoute.location,
                        isRequired: true,
                        maxLength: 56
                    )
                    FloatingLabelInputField(
                        title: "фандом",
                        placeholder: "фандом маршрута",
                        text: $newRoute.fandom,
                        isRequired: true,
                        maxLength: 56
                    )

                    // Сложность (выпадающий список)
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Text("*")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(AppColors.accent)
                            Text("сложность")
                                .font(.system(size: 20, weight: .semibold)) // Уменьшен размер шрифта
                                .foregroundColor(AppColors.primaryText)
                        }
                        .padding(.leading, 16) // Отступ слева
                        Menu {
                            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                                Button {
                                    newRoute.difficulty = difficulty
                                } label: {
                                    Text(difficulty.localizedString)
                                }
                            }
                        } label: {
                            HStack {
                                Text(newRoute.difficulty.localizedString)
                                    .foregroundColor(AppColors.primaryText)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(AppColors.secondaryText)
                            }
                            .padding(.horizontal, 24) // Увеличен отступ для поля
                            .padding(.vertical, 12)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(AppColors.divider),
                                alignment: .bottom
                            )
                        }
                        .padding(.horizontal, 16) // Отступ слева и справа
                    }
                    .padding(.vertical, 8)

                    // Время
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Text("*")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(AppColors.accent)
                            Text("длительность")
                                .font(.system(size: 20, weight: .semibold)) // Уменьшен размер шрифта
                                .foregroundColor(AppColors.primaryText)
                        }
                        .padding(.leading, 16) // Отступ слева
                        HStack {
                            NumberInput(value: Binding(
                                get: { Double(newRoute.durationHours) },
                                set: { newRoute.durationHours = Int($0) }
                            ), placeholder: "00", suffix: "ч")
                            NumberInput(value: Binding(
                                get: { Double(newRoute.durationMinutes) },
                                set: { newRoute.durationMinutes = Int($0) }
                            ), placeholder: "00", suffix: "мин")
                        }
                        .padding(.horizontal, 24) // Увеличен отступ для поля
                    }
                    .padding(.horizontal, 16) // Отступ слева и справа
                    .padding(.vertical, 8)

                    // Расстояние
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Text("*")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(AppColors.accent)
                            Text("расстояние")
                                .font(.system(size: 20, weight: .semibold)) // Уменьшен размер шрифта
                                .foregroundColor(AppColors.primaryText)
                        }
                        .padding(.leading, 16) // Отступ слева
                        HStack {
                            NumberInput(value: $newRoute.distanceKm, placeholder: "00", suffix: "км")
                            NumberInput(value: $newRoute.distanceMeters, placeholder: "00", suffix: "м")
                        }
                        .padding(.horizontal, 24) // Увеличен отступ для поля
                    }
                    .padding(.horizontal, 16) // Отступ слева и справа
                    .padding(.vertical, 8)

                    // Стоимость
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Text("*")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(AppColors.accent)
                            Text("стоимость")
                                .font(.system(size: 20, weight: .semibold)) // Уменьшен размер шрифта
                                .foregroundColor(AppColors.primaryText)
                        }
                        .padding(.leading, 16) // Отступ слева
                        NumberInput(value: Binding(
                            get: { Double(newRoute.cost) },
                            set: { newRoute.cost = Int($0) }
                        ), placeholder: "0", suffix: "₽")
                        .padding(.horizontal, 24) // Увеличен отступ для поля
                    }
                    .padding(.horizontal, 16) // Отступ слева и справа
                    .padding(.vertical, 8)

                    // Секция "ТОЧКИ"
                    VStack(alignment: .leading, spacing: 0) {
                        SectionHeader(title: "точки") // Размер уже увеличен в компоненте SectionHeader
                        // Кнопка добавления точки (центрирована)
                        Button(action: addTrailPoint) {
                            HStack(spacing: 8) {
                                Text("+")
                                    .font(.system(size: 14)) // Уменьшен размер шрифта
                                Text("добавить точку")
                                    .font(.system(size: 14)) // Уменьшен размер шрифта
                            }
                            .foregroundColor(AppColors.secondaryText)
                            .frame(maxWidth: .infinity) // Растягиваем на всю ширину
                            .multilineTextAlignment(.center) // Центрируем текст
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                        // Список точек
                        ForEach($newRoute.trailPoints.indices, id: \.self) { index in
                            TrailPointView(
                                point: $newRoute.trailPoints[index],
                                onAddImage: { selectedPointIndex = index; showImagePicker = true }
                            )
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                        }
                    }

                    // Кнопка публикации
                    Button(action: publishRoute) {
                        Text("опубликовать")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(.black)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                    .disabled(newRoute.trailPoints.count < 2)
                    .alert("маршрут опубликован", isPresented: $showingAlert) {
                        Button("ок", role: .cancel) { resetForm() }
                    }
                }
                .background(AppColors.background)
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: Binding(
                    get: { UIImage() },
                    set: { image in
                        if let image = image, let url = saveImageToTemporaryDirectory(image: image) {
                            newRoute.trailPoints[selectedPointIndex].photoURL = url
                        }
                    }
                ))
            }
        }
    }

    // MARK: - Вспомогательные методы
    private func addTrailPoint() {
        newRoute.trailPoints.append(NewTrailPoint())
    }

    private func publishRoute() {
        let route = newRoute.toRoute()
        print("создан маршрут: \(route)")
        showingAlert = true
    }

    private func resetForm() {
        newRoute = NewRoute()
    }

    private func saveImageToTemporaryDirectory(image: UIImage) -> URL? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        let filename = UUID().uuidString + ".jpg"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
        do {
            try data.write(to: url)
            return url
        } catch {
            print("ошибка сохранения изображения: \(error)")
            return nil
        }
    }
}

// MARK: - Компоненты интерфейса
struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.system(size: 24, weight: .bold)) // Увеличен размер шрифта
            .foregroundColor(AppColors.primaryText)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColors.background)
    }
}

// MARK: - Плавающий заголовок для TextField
struct FloatingLabelInputField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isRequired: Bool = false
    var maxLength: Int = Int.max

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Заголовок с символом "*"
            HStack(spacing: 8) {
                if isRequired {
                    Text("*")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(AppColors.accent)
                }
                Text(title)
                    .font(.system(size: 20, weight: .semibold)) // Уменьшен размер шрифта
                    .foregroundColor(AppColors.primaryText)
            }
            .padding(.leading, 16) // Отступ слева
            // TextField с placeholder
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(AppColors.secondaryText)
                        .padding(.leading, 24) // Увеличен отступ для плейсхолдера
                        .opacity(0.5)
                }
                TextField("", text: $text)
                    .foregroundColor(AppColors.primaryText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.vertical, 8)
                    .onChange(of: text) { newValue in
                        if newValue.count > maxLength {
                            text = String(newValue.prefix(maxLength))
                        }
                    }
            }
            .padding(.horizontal, 24) // Увеличен отступ для поля
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(AppColors.divider)
                    .padding(.horizontal, 32), // Увеличен отступ для подчеркивания
                alignment: .bottom
            )
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Поле для ввода чисел
struct NumberInput: View {
    @Binding var value: Double
    let placeholder: String
    let suffix: String

    var body: some View {
        HStack(spacing: 4) {
            TextField(placeholder, value: $value, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
                .foregroundColor(AppColors.primaryText)
                .frame(width: 40)
                .multilineTextAlignment(.trailing)
                .padding(.horizontal, 24) // Увеличен отступ для поля
            Text(suffix)
                .foregroundColor(AppColors.secondaryText)
        }
    }
}

struct TrailPointView: View {
    @Binding var point: NewTrailPoint
    var onAddImage: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Название точки
            TextField("название точки", text: $point.name)
                .foregroundColor(AppColors.primaryText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 8)
                .padding(.horizontal, 24) // Увеличен отступ для поля
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(AppColors.divider)
                        .padding(.horizontal, 32), // Увеличен отступ для подчеркивания
                    alignment: .bottom
                )
            // Описание точки
            TextField("описание точки", text: $point.description)
                .foregroundColor(AppColors.primaryText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 8)
                .padding(.horizontal, 24) // Увеличен отступ для поля
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(AppColors.divider)
                        .padding(.horizontal, 32), // Увеличен отступ для подчеркивания
                    alignment: .bottom
                )
            // Ссылка на карту
            TextField("ссылка на локацию точки", text: $point.mapLink)
                .foregroundColor(AppColors.primaryText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 8)
                .padding(.horizontal, 24) // Увеличен отступ для поля
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(AppColors.divider)
                        .padding(.horizontal, 32), // Увеличен отступ для подчеркивания
                    alignment: .bottom
                )
            // Кнопка добавления фото
            Button(action: onAddImage) {
                if let photoURL = point.photoURL, let image = UIImage(contentsOfFile: photoURL.path) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .cornerRadius(8)
                        .clipped()
                        .overlay(
                            Button(action: { point.photoURL = nil }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.7))
                                    .clipShape(Circle())
                            }
                            .padding(8),
                            alignment: .topTrailing
                        )
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(AppColors.divider, style: StrokeStyle(lineWidth: 1, dash: [4]))
                            .frame(height: 44)
                        Text("+ добавить фото")
                            .font(.system(size: 14))
                            .foregroundColor(AppColors.secondaryText)
                    }
                }
            }
        }
    }
}
