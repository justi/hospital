Bill::HABTM_BillItems.create!([
  {bill_id: 3, bill_item_id: 1},
  {bill_id: 4, bill_item_id: 1},
  {bill_id: 4, bill_item_id: 2},
  {bill_id: 7, bill_item_id: 2},
  {bill_id: 7, bill_item_id: 3}
])
BillItem::HABTM_Bills.create!([
  {bill_id: 3, bill_item_id: 1},
  {bill_id: 4, bill_item_id: 1},
  {bill_id: 4, bill_item_id: 2},
  {bill_id: 7, bill_item_id: 2},
  {bill_id: 7, bill_item_id: 3}
])
Address.create!([
  {addressable_type: "Patient", addressable_id: 3, city: nil, street_name: nil, street_no: nil, postal_code: nil},
  {addressable_type: "Patient", addressable_id: 4, city: nil, street_name: nil, street_no: nil, postal_code: nil},
  {addressable_type: "Patient", addressable_id: nil, city: "Poznan", street_name: "Na Miasteczku 12/B145", street_no: nil, postal_code: nil},
  {addressable_type: "Patient", addressable_id: 5, city: "Poznan2", street_name: "Na Miasteczku 12/B145", street_no: nil, postal_code: nil},
  {addressable_type: "Patient", addressable_id: 6, city: "Poznan22", street_name: "Na Miasteczku 12/B145", street_no: nil, postal_code: nil},
  {addressable_type: "Patient", addressable_id: 7, city: "sadasd", street_name: "dssd", street_no: "2", postal_code: "2"},
  {addressable_type: "Patient", addressable_id: 8, city: "asd", street_name: "", street_no: "asd", postal_code: "1"},
  {addressable_type: "Patient", addressable_id: 9, city: "dsfsdf", street_name: "dsf", street_no: "2", postal_code: "dfs"},
  {addressable_type: "Staff", addressable_id: 5, city: "dsfdsf", street_name: "", street_no: "dsf", postal_code: "df"},
  {addressable_type: "Patient", addressable_id: 13, city: "sd", street_name: "sad", street_no: "sad", postal_code: "asd"}
])
Appointment.create!([
  {doctor_id: 1, nurse_id: nil, reservation_id: 2},
  {doctor_id: 1, nurse_id: 3, reservation_id: 5}
])
Bill.create!([
  {appointment_id: 1, is_paid: false, paid_date: nil},
  {appointment_id: 1, is_paid: true, paid_date: "2019-03-31 11:56:18"},
  {appointment_id: 1, is_paid: true, paid_date: "2019-03-31 12:00:43"},
  {appointment_id: 4, is_paid: false, paid_date: nil}
])
BillItem.create!([
  {name: "gips", price: "1.1"},
  {name: "echo serca", price: "2.0"},
  {name: "rezonans magnetyczny", price: "4.0"}
])
Patient.create!([
  {name: "Olga", surname: "Małecka", pesel: "123456786"},
  {name: "Jan", surname: "Kowalski", pesel: "12345678123"},
  {name: "Justyna Wojtczak", surname: "Wojtczak", pesel: "11111111111"},
  {name: "sdfsf", surname: "sdfsd", pesel: "11111111111"},
  {name: "Justyna Wojtczak", surname: "Wojtczak", pesel: "11111111111"},
  {name: "Justyna Wojtczak", surname: "Wojtczak2", pesel: "11111111111"},
  {name: "sdadad", surname: "sadad", pesel: "11111111111"},
  {name: "asda", surname: "asd", pesel: "11111111111"},
  {name: "xcdf", surname: "fsdf", pesel: "11111111111"},
  {name: "do usuniecia", surname: "asd", pesel: "11111111111"}
])
Reservation.create!([
  {reservation_time: "2019-03-30 11:52:00", patient_id: 1},
  {reservation_time: "2019-03-30 16:12:00", patient_id: 2},
  {reservation_time: "2019-05-31 14:01:00", patient_id: 13}
])
Staff.create!([
  {name: "Waldemar", surname: "Nowak", pesel: "3432434234", occupation: "doctor"},
  {name: "sdsfs", surname: "erwerwe", pesel: "12344567823", occupation: "nurse"},
  {name: "wewr", surname: "werwer", pesel: "12345678901", occupation: "nurse"},
  {name: "dsfsd", surname: "sdfsf", pesel: "11111111111", occupation: "doctor"}
])
