import UIKit


// 지역 상관없이 UTC 시간으로 출력
let date = Date()
print(date)


//2001년 01월 01일 기준 으로 몇초가 지났는지 계산 후 출력
var dt = Date(timeIntervalSinceReferenceDate: 3600)
print(dt)

let onesec = TimeInterval(1)
print(onesec)


// public typealias TimeInterval = Double  -> TimeInterval 은 Double 형태로 선언
let oneMsec = TimeInterval(0.001)
let oneMin = TimeInterval(60)
let oneHour1 = TimeInterval(oneMin * 60)
let oneHour2 = TimeInterval(60 * 60)
let oneHour3 = TimeInterval(3600)
let oneDay = TimeInterval(oneHour1 * 24)

print(oneMsec)
print(oneMin)
print(oneHour1)
print(oneHour2)
print(oneHour3)
print(oneDay)

//지금으로 하루 지난 후 시간
print(Date(timeIntervalSinceNow: oneDay))

//calendar 속성
let now = Date()
let calendar = Calendar.current
let component = calendar.dateComponents([.year,.month,.day], from: now)

print(component.year)
print(component.month)
print(component.day)

let year = calendar.component(.year, from: now)
print(year)

//표준시는 지역마다 다르며 특별한 설정 없이는 ios 기준시로 표기

let calendars = Calendar.current
var components = DateComponents()
components.year = 2023
components.month = 4
components.day = 29
components.timeZone = TimeZone(identifier: "Asia/Seoul")
let kor = calendars.date(from:components)
components.timeZone = TimeZone(identifier: "America/Los_Angeles")
let LA = calendars.date(from: components)

print(kor)
print(LA)

//dateformatter 형식으로 내가 원하는 방식으로 날짜를 커스텁해서 출력

let formatter = DateFormatter()
formatter.dateStyle = .full
formatter.timeStyle = .medium
formatter.locale = Locale(identifier: "ko_kr")

//만약 formatter가 전달받는 파라미터가 optional 이라면 string(from:)이 아니라 string(for:)을 사용해야 함
var result = formatter.string(from: now)
print(result)

// 반복적으로 사용할 필요가 없을시 인스턴스 생성하지 말고 Class 함수를 사용할 수 있다.
DateFormatter.localizedString(from: now, dateStyle: .full, timeStyle: .medium)



let yesterday = now.addingTimeInterval(3600 * -24)
let tommorrow = now.addingTimeInterval(3600 * 24)

print(formatter.string(from: now))
print(formatter.string(from: yesterday))
print(formatter.string(from: tommorrow))

//doseRelativeDateFormatting = true 로 바꿔주면 -> 48시간 이내 날짜를 그저께,어제,내일,모래로 변환해 표현
formatter.dateStyle = .full
formatter.timeStyle = .none

formatter.doesRelativeDateFormatting = true

print(formatter.string(from: now))   // 오늘
print(formatter.string(from: yesterday)) // 어제
print(formatter.string(from: tommorrow)) // 내일

