import 'dart:math';

import 'package:flutter/material.dart';

import './models/product.dart';

int random(min, max) {
    return min + Random().nextInt(max - min);
  }

const DUMMY_PRODUCTS = const [
  Product(
id: '0',
title: 'Sponsored Ad - ULTRALOQ Smart Lock U-Bolt Pro, 6-in-1 Keyless Entry Door Lock with Bluetooth, Biometric Fingerprint and Ke...',
// pret: random(5, 20),
linkImg: 'https://m.media-amazon.com/images/I/61rzPSDHH0L._AC_UL320_.jpg'
),
Product(
id: '1',
title: 'Sponsored Ad - Echo Show 10 (3rd Gen) | HD smart display with motion and Alexa | Glacier White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51vuAEcgqvL._AC_UL320_.jpg'
),
Product(
id: '2',
title: 'Sponsored Ad - Emporia Smart Home Energy Monitor with 16 50A Circuit Level Sensors | Real Time Electricity Monitor/Meter |...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-yO4nnK4L._AC_UL320_.jpg'
),
Product(
id: '3',
title: 'Sponsored Ad - Brilliant Smart Dimmer Switch (White) — Compatible with Alexa, Google Assistant, Apple HomeKit, Hue, LIFX, ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51J7RxCa6QL._AC_UL320_.jpg'
),
Product(
id: '4',
title: 'Kasa Smart Plug HS103P4, Smart Home Wi-Fi Outlet Works with Alexa, Echo, Google Home & IFTTT, No Hub Required, Remote Cont...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51j980zl6ML._AC_UL320_.jpg'
),
Product(
id: '5',
title: 'Echo Dot (3rd Gen, 2018 release) - Smart speaker with Alexa - Charcoal',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/6182S7MYC2L._AC_UL320_.jpg'
),
Product(
id: '6',
title: 'Echo Show 10 (3rd Gen) | HD smart display with motion and Alexa | Charcoal',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51EVETDOOeL._AC_UL320_.jpg'
),
Product(
id: '7',
title: 'Sponsored Ad - Pocketalk Classic Language Translator Device - Portable Two-Way Voice Interpreter - 82 Language Smart Trans...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/515RbJ0EsQS._AC_UL320_.jpg'
),
Product(
id: '8',
title: 'Sponsored Ad - Daytech Caregiver Pager System Call Button Personal Alert Pager for Home Elderly Attendant Patient Nurses S...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rUqXE7azL._AC_UL320_.jpg'
),
Product(
id: '9',
title: 'Sponsored Ad - Arylic WiFi & Bluetooth Home Amplifier,TPA3116 with 50+50W 24V DC/2.0 Stereo Channel,Airplay 1 DLNA,Multiro...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61C7DXo13kL._AC_UL320_.jpg'
),
Product(
id: '10',
title: 'Sponsored Ad - 64GB Keychain Voice Recorder, Telele Audio Voice Recorder with 750 Hours Recording Capacity and 25 Hours Ba...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/5165aoLX0GL._AC_UL320_.jpg'
),
Product(
id: '11',
title: 'Sponsored Ad - Link Dream Bluetooth Earpiece for Cell Phone Hands Free Wireless Headset Noise Cancelling Mic 24Hrs Talking...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rqivOcLML._AC_UL320_.jpg'
),
Product(
id: '12',
title: 'Echo (4th Gen) | With premium sound, smart home hub, and Alexa | Charcoal',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61y4J2vTwFL._AC_UL320_.jpg'
),
Product(
id: '13',
title: 'Sengled Alexa Light Bulb, Smart Light Bulbs That Work with Alexa Only, Bluetooth Mesh Standard A19 E26 Dimmable LED Bulb D...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51Tg6K6M-ES._AC_UL320_.jpg'
),
Product(
id: '14',
title: 'Kasa Smart Light Switch HS200P3, Single Pole, Needs Neutral Wire, 2.4GHz Wi-Fi Light Switch Works with Alexa and Google Ho...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61VvqSdT5OL._AC_UL320_.jpg'
),
Product(
id: '15',
title: 'Blink Outdoor - wireless, weather-resistant HD security camera, two-year battery life, motion detection, set up in minutes...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51XU0dgFDlL._AC_UL320_.jpg'
),
Product(
id: '16',
title: 'Smart WiFi Wireless Essential Oil Aromatherapy 400ml Ultrasonic Diffuser & Humidifier with Alexa & Google Home Phone App &...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/713+ykRgTIL._AC_UL320_.jpg'
),
Product(
id: '17',
title: 'OHLUX Smart WiFi LED Light Bulbs Work with Alexa & Google Assistant (No Hub Required), AC100-240V, RGBCW Multi-Color, Warm...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71xro8dWZML._AC_UL320_.jpg'
),
Product(
id: '18',
title: 'Google Nest Thermostat - Smart Thermostat for Home - Programmable Wifi Thermostat - Charcoal',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51no7RTyGRL._AC_UL320_.jpg'
),
Product(
id: '19',
title: 'Smart Plug ESICOO - Alexa, Echo & Google Home - Only WiFi 2.4G (4-Pack)',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71sJnpoV5aL._AC_UL320_.jpg'
),
Product(
id: '20',
title: 'Smart Light Switch Treatlife Single Pole Smart Switch Works with Alexa, Google Home and SmartThings, 2.4GHz Wi-Fi Timer Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51FaKKcgpaL._AC_UL320_.jpg'
),
Product(
id: '21',
title: 'Philips Hue Premium Smart Bulbs, 16 Million Colors, for Most Lamps & Overhead Lights, Hub Required, Compatible with Alexa,...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61YHNvRNaCL._AC_UL320_.jpg'
),
Product(
id: '22',
title: 'Brilliant Smart Home Control (2-Switch Panel) — Alexa Built-In & Compatible with Ring, Sonos, Hue, Google Nest, Wemo, Smar...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71P861nSclL._AC_UL320_.jpg'
),
Product(
id: '23',
title: 'Sponsored Ad - Echo Link Amp - Stream and amplify hi-fi music to your speakers',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51IsRpQK1aL._AC_UL320_.jpg'
),
Product(
id: '24',
title: 'Sponsored Ad - Echo Link - Stream hi-fi music to your stereo system',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41KhwC+yzPL._AC_UL320_.jpg'
),
Product(
id: '25',
title: 'Smart Plug Amysen - A Certified & Alexa, Echo & Google Home – Only WiFi 2.4G (4- Pack)',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rebB9rK-L._AC_UL320_.jpg'
),
Product(
id: '26',
title: 'Smart Lock, hornbill Fingerprint Deadbolt Lock with Touchscreen Keypad, Keyless Entry Front Door Lock, Bluetooth Electroni...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ICDMVTI3S._AC_UL320_.jpg'
),
Product(
id: '27',
title: 'August Wi-Fi, (4th Generation) Smart Lock – Fits Your Existing Deadbolt in Minutes, Silver',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jPqZxl+NL._AC_UL320_.jpg'
),
Product(
id: '28',
title: 'Ceiling Fan with Lights, Indoor & Outdoor Ceiling Fan，48" Low Profile DC Smart Ceiling Fan Works with Alexa, Siri, Google ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EMgV64R6L._AC_UL320_.jpg'
),
Product(
id: '29',
title: 'NETGEAR Wi-Fi Range Extender EX3700 - Coverage Up to 1000 Sq Ft and 15 Devices with AC750 Dual Band Wireless Signal Booste...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61z5oOk5fzL._AC_UL320_.jpg'
),
Product(
id: '30',
title: 'Ukoke USPC02S Smart WiFi Portable Air Conditioner, Compatible with Alexa & Mobile App Control, 10000BTU,3 in 1 AC Unit wit...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61iSjJsrRfL._AC_UL320_.jpg'
),
Product(
id: '31',
title: 'Kasa Smart Light Bulbs, Full Color Changing Dimmable Smart WiFi Bulbs Compatible with Alexa and Google Home, A19, 9W 800 L...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61Y-TtwpVIL._AC_UL320_.jpg'
),
Product(
id: '32',
title: 'Kasa Smart Plug Power Strip HS300, Surge Protector with 6 Individually Controlled Smart Outlets and 3 USB Ports, Works wit...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61PI8akrKOL._AC_UL320_.jpg'
),
Product(
id: '33',
title: 'Kasa Smart Light Switch HS200, Single Pole, Needs Neutral Wire, 2.4GHz Wi-Fi Light Switch Works with Alexa and Google Hom...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71nMzhO05jL._AC_UL320_.jpg'
),
Product(
id: '34',
title: 'Emporia Smart Home Energy Monitor with 16 50A Circuit Level Sensors | Real Time Electricity Monitor/Meter | Solar/Net Mete...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-yO4nnK4L._AC_UL320_.jpg'
),
Product(
id: '35',
title: 'Kidde Nighthawk Carbon Monoxide Detector, AC-Plug-In with Battery Backup, Digital Display',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61lalSuAknL._AC_UL320_.jpg'
),
Product(
id: '36',
title: 'ZigBee Wireless Remote Control Smart Switch Wall Panel Transmitter,Requires MoesGo zigbee Hub,Smart Life/Tuya APP Remote C...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61UFHBcoZFL._AC_UL320_.jpg'
),
Product(
id: '37',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '38',
title: 'Sponsored Ad - ROSONG Smart Sunset Lamp Projector-App-Controlled Multiple-Colors',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81DfeuiZn8L._AC_UL320_.jpg'
),
Product(
id: '39',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '40',
title: 'iReliev Wireless TENS + EMS Therapeutic Wearable System Wireless TENS Unit + Muscle Stimulator Combination for Pain Relie...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81nNb8OqbiL._AC_UL320_.jpg'
),
Product(
id: '41',
title: 'Lutron Caseta Deluxe Smart Dimmer Switch (2 Count) Kit | Works with Alexa, Apple HomeKit, and the Google Assistant | P-BD...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61HYWEYgzbL._AC_UL320_.jpg'
),
Product(
id: '42',
title: 'Mini Smart Plug, Smart Home Wi-Fi Plug Work with Alexa and Google Home, Surge Protector Remote & Voice Control Smart Outle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61cQFSLm4fL._AC_UL320_.jpg'
),
Product(
id: '43',
title: 'APGOOFACE Dimmable Low Profile Flush Mount Ceiling Fan with Light, APP & Remote Control Enclosed Ceiling Fan, 3-Color Smar...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71fDJxxVXlL._AC_UL320_.jpg'
),
Product(
id: '44',
title: 'Keyless Entry Door Lock - Smart Deadbolt Lock with Bluetooth App, Electronic Keypad, IC Card, Spare Keys. Security Waterpr...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61q3D4rgGDL._AC_UL320_.jpg'
),
Product(
id: '45',
title: 'Meross Smart Plug Mini, 15A & Reliable Wi-Fi, Support Apple HomeKit, Siri, Alexa, Echo, Google Assistant and Nest Hub, App...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61KNmAv7oJL._AC_UL320_.jpg'
),
Product(
id: '46',
title: 'Diaotec Smart Plug - Mini WiFi Smart Outlet Plugs Work with Alexa and Google Home for Voice Control, Remote Control Smart ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51fhr0N5c8L._AC_UL320_.jpg'
),
Product(
id: '47',
title: 'Body Fat Scale, Bveiugn Smart Scale for Body Weight BMI Digital Bathroom Wireless Scales, Body Composition Analyzer with H...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61N0NW35WXL._AC_UL320_.jpg'
),
Product(
id: '48',
title: 'ibaye LED Floor Lamp, RGB Color Changing Modern Corner Lamp with Alexa, Google Assistant and WiFi APP, 16 Million Colors, ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61gDk2yEsRL._AC_UL320_.jpg'
),
Product(
id: '49',
title: 'BLACK+DECKER Works with Alexa Smart Under Cabinet Lighting Kit, Adjustable LEDs, (3) 9" Bars White, A Certified for Humans...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61oN9rQxRiL._AC_UL320_.jpg'
),
Product(
id: '50',
title: 'Echo Auto- Hands-free Alexa in your car with your phone',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/31X1pWv1CXL._AC_UL320_.jpg'
),
Product(
id: '51',
title: 'Honeywell Home RTH9585WF1004 Wi-Fi Smart Color Thermostat, 7 Day Programmable, Touch Screen, Energy Star, Alexa Ready, Gray',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81iSTdLWl4L._AC_UL320_.jpg'
),
Product(
id: '52',
title: 'Kasa Smart Plug Power Strip KP303, Surge Protector with 3 Individually Controlled Smart Outlets and 2 USB Ports, Works wit...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61yUqv7M9VL._AC_UL320_.jpg'
),
Product(
id: '53',
title: 'KMC Smart Plug Mini 4-Pack, Wi-Fi Outlets for Smart Home, Remote Control Lights and Devices from Anywhere, No Hub Require...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61pYQz04ifL._AC_UL320_.jpg'
),
Product(
id: '54',
title: 'Level Bolt Smart Lock, Bluetooth Deadbolt, Works with Your Existing Lock, Keyless Entry, Smartphone Access, Works with App...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/8108+g2Fq1L._AC_UL320_.jpg'
),
Product(
id: '55',
title: 'Kasa Smart Plug HS103P2, Smart Home Wi-Fi Outlet Works with Alexa, Echo, Google Home & IFTTT, No Hub Required, Remote Cont...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51AXKKzm3aL._AC_UL320_.jpg'
),
Product(
id: '56',
title: 'GE CYNC Outdoor Smart Plug, Alexa and Google Home Compatible, Bluetooth and Wi-Fi Enabled, No Hub Required',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71KAJ4N48DS._AC_UL320_.jpg'
),
Product(
id: '57',
title: 'Ecobee3 Lite SmartThermostat, Black',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51w7w-cIySL._AC_UL320_.jpg'
),
Product(
id: '58',
title: 'SONOFF NSPanel WiFi Smart Scene Wall Switch,2-Switch Panel Smart Home Control,Touchscreen Control for Smart Temperature Fu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51h0TTHMQPL._AC_UL320_.jpg'
),
Product(
id: '59',
title: 'Xperia 1 III Smartphone with 6.5" 21:9 4K HDR OLED 120Hz Display with Triple Camera and Four Focal Lengths',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/611v9lKNlaL._AC_UL320_.jpg'
),
Product(
id: '60',
title: 'Facebook Portal - Smart Video Calling 10” Touch Screen Display with Alexa – White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Xdy2MoreL._AC_UL320_.jpg'
),
Product(
id: '61',
title: 'Smart Ceiling Fan with Lights, Indoor & Outdoor Ceiling Fan with Remote, 10 Speeds Smart Ceiling Fan Compatible with Alex...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51VdYkfLEsL._AC_UL320_.jpg'
),
Product(
id: '62',
title: 'Amazon eero 6 dual-band mesh Wi-Fi 6 system with built-in Zigbee smart home hub (3-pack, one eero 6 router + two eero 6 ex...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/412FFoC11ML._AC_UL320_.jpg'
),
Product(
id: '63',
title: 'Treatlife Smart Ceiling Fan Control, 4 Speed Fan Switch for Ceiling Fan, Neutral Wire Required, Smart Home Devices that Wo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61+6OPjyg8L._AC_UL320_.jpg'
),
Product(
id: '64',
title: 'Sponsored Ad - BUTT BUDDY - Bidet Toilet Seat Attachment & Fresh Water Sprayer (Easy to Install, Universal Fit, No Plumbin...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51qGjmvol6L._AC_UL320_.jpg'
),
Product(
id: '65',
title: 'Sponsored Ad - Eversecu 4CH Smart Wireless Security Camera System 4pcs 1080P 2MP Outdoor Cameras & DVR Kit Support Face Ca...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51tuDTWRlGL._AC_UL320_.jpg'
),
Product(
id: '66',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '67',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '68',
title: 'Sponsored Ad - RGBIC Smart LED Light Bars │ Tuya WiFi + BLE (Wireless Conect) Double Mode │ Music Sync │ Dream Color │ Voi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61TCbBPD7OL._AC_UL320_.jpg'
),
Product(
id: '69',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '70',
title: 'Sponsored Ad - Sunset Lamp Projection,16 Colors Sunset lamp with APP Remote Control/4 Modes,UFO Shape Sunset Light,Sunset ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ta0I2lNDL._AC_UL320_.jpg'
),
Product(
id: '71',
title: 'HBN Smart Plug 15A, WiFi&Bluetooth Outlet Extender Dual Socket Plugs Works with Alexa, Google Home Assistant, Remote Contr...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61yED3sOQGL._AC_UL320_.jpg'
),
Product(
id: '72',
title: 'KMC Smart Plug Mini 4-Pack, Wi-Fi Outlets for Smart Home, Remote Control Lights and Devices from Anywhere, No Hub Require...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61pYQz04ifL._AC_UL320_.jpg'
),
Product(
id: '73',
title: 'SwitchBot Smart Switch Button Pusher - No Wiring, Wireless App or Timer Control, Add SwitchBot Hub Mini to Make it Compati...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41wkGHCrX0S._AC_UL320_.jpg'
),
Product(
id: '74',
title: 'Keyless Entry Door Lock - Smart Deadbolt Lock with Bluetooth App, Electronic Keypad, IC Card, Spare Keys. Security Waterpr...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61q3D4rgGDL._AC_UL320_.jpg'
),
Product(
id: '75',
title: 'BERENNIS Smart WiFi Light Bulbs, Color Changing LED Lights, Work with Alexa Echo, Google Home, Siri and IFTTT, No Hub Requ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RnNk5W9+L._AC_UL320_.jpg'
),
Product(
id: '76',
title: 'Smart Plug, Lumary Smart Outlets That Work with Alexa & Google Assistant, Timer Function & Group Controller, No Hub Requir...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51+O+fuEIdL._AC_UL320_.jpg'
),
Product(
id: '77',
title: 'BUTT BUDDY - Bidet Toilet Seat Attachment & Fresh Water Sprayer (Easy to Install, Universal Fit, No Plumbing or Electricit...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51qGjmvol6L._AC_UL320_.jpg'
),
Product(
id: '78',
title: 'Treatlife Smart Ceiling Fan Control, 4 Speed Fan Switch for Ceiling Fan, Neutral Wire Required, Smart Home Devices that Wo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61+6OPjyg8L._AC_UL320_.jpg'
),
Product(
id: '79',
title: 'Ecobee3 Lite SmartThermostat, Black',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51w7w-cIySL._AC_UL320_.jpg'
),
Product(
id: '80',
title: 'BLACK+DECKER Works with Alexa Smart Under Cabinet Lighting Kit, Adjustable LEDs, (3) 9" Bars White, A Certified for Humans...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61oN9rQxRiL._AC_UL320_.jpg'
),
Product(
id: '81',
title: 'Smart WiFi Light Bulbs, LED Color Changing Lights, Works with Alexa & Google Assistant, RGBW 2700K-6500K, 60 Watt Equivale...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61VfSRRVP-S._AC_UL320_.jpg'
),
Product(
id: '82',
title: 'Smart Lock,Keyless Entry Door Lock,Smart Deadbolt,Smart Door Lock,Deadbolt,Deadbolt Lock,Digital Door Lock,Keypad Deadbolt...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71hn3cs4IdL._AC_UL320_.jpg'
),
Product(
id: '83',
title: 'Sponsored Ad - 80ft Led Strip Lights (2 Rolls of 40ft) Keepsmile Smart App Music Sync Color Changing Led Light Strip with ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81aaB7hoRAL._AC_UL320_.jpg'
),
Product(
id: '84',
title: 'APGOOFACE Dimmable Low Profile Flush Mount Ceiling Fan with Light, APP & Remote Control Enclosed Ceiling Fan, 3-Color Smar...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71fDJxxVXlL._AC_UL320_.jpg'
),
Product(
id: '85',
title: 'Door Opener WiFi Electric Swing Door,Residential Door Opener WiFi Device with WiFi Smart Home Device Workable with Alexa a...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61a2WQcNgzL._AC_UL320_.jpg'
),
Product(
id: '86',
title: 'Brilliant Smart Home Control (2-Switch Panel) — Alexa Built-In & Compatible with Ring, Sonos, Hue, Google Nest, Wemo, Smar...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71P861nSclL._AC_UL320_.jpg'
),
Product(
id: '87',
title: 'G-Homa Outdoor Smart Plug Waterproof, Bluetooth & Wi-Fi 15A Plugs with 2 Sockets, Smart Outlet Work with Alexa and Google ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71J6bbiuTTL._AC_UL320_.jpg'
),
Product(
id: '88',
title: 'Kasa Outdoor Smart Plug, Smart Home Wi-Fi Outlet with 2 Sockets, IP64 Weather Resistance, Compatible with Alexa, Google Ho...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51FksYIWiSS._AC_UL320_.jpg'
),
Product(
id: '89',
title: 'CoreSure Smart Keyless Entry Door Lock - Fingerprint Electronic Deadbolt Door Lock, Auto Locking, Biometric Smart Door Loc...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71OC9B1eG5L._AC_UL320_.jpg'
),
Product(
id: '90',
title: 'Kasa Smart Dimmer Switch HS220, Single Pole, Needs Neutral Wire, 2.4GHz Wi-Fi Light Switch Works with Alexa and Google Hom...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71oZlpY3p+L._AC_UL320_.jpg'
),
Product(
id: '91',
title: 'Honeywell Home RTH9585WF1004 Wi-Fi Smart Color Thermostat, 7 Day Programmable, Touch Screen, Energy Star, Alexa Ready, Gray',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81iSTdLWl4L._AC_UL320_.jpg'
),
Product(
id: '92',
title: 'Security Camera Indoor 1080p WiFi Camera (2.4G Only) 360 Degree View Smart Camera with Night Vision, 2-Way Audio, Smart Tr...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61awczw5MML._AC_UL320_.jpg'
),
Product(
id: '93',
title: 'Sengled Alexa Light Bulb, WiFi Light Bulbs No Hub Required, Smart Bulbs that Work with Alexa, Google Home, Dimmable Smart ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ju+OBNspS._AC_UL320_.jpg'
),
Product(
id: '94',
title: 'SYLVANIA Wifi LED Smart Light Bulb, 60W Equivalent Full Color and Tunable White A19, Dimmable, Compatible with Alexa and G...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61t+Oe4gmSL._AC_UL320_.jpg'
),
Product(
id: '95',
title: 'Blink Mini – Compact indoor plug-in smart security camera, 1080 HD video, night vision, motion detection, two-way audio, W...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/519wvavl5cL._AC_UL320_.jpg'
),
Product(
id: '96',
title: 'Sponsored Ad - SV3CHome Deadbolt Smart Lock, Bluetooth Control, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51R2cKWDDeL._AC_UL320_.jpg'
),
Product(
id: '97',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '98',
title: 'Sponsored Ad - RGB Music Level Light Bar App Control, Rechargeable Sound Control Rhythm Light with Fragrance and clamp, 32...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-TtViPLZL._AC_UL320_.jpg'
),
Product(
id: '99',
title: 'SwitchBot Curtain Smart Electric Motor - Wireless App or Automate Timer Control, Add SwitchBot Hub Mini to Make it Compati...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81G8-d-B-ML._AC_UL320_.jpg'
),
Product(
id: '100',
title: 'Amazon eero 6 dual-band mesh Wi-Fi 6 system with built-in Zigbee smart home hub (3-pack, one eero 6 router + two eero 6 ex...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/412FFoC11ML._AC_UL320_.jpg'
),
Product(
id: '101',
title: 'Smart Light Switch Treatlife Single Pole Smart Switch Works with Alexa, Google Home and SmartThings, 2.4GHz Wi-Fi Timer Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51FaKKcgpaL._AC_UL320_.jpg'
),
Product(
id: '102',
title: 'SONOFF NSPanel WiFi Smart Scene Wall Switch,2-Switch Panel Smart Home Control,Touchscreen Control for Smart Temperature Fu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51h0TTHMQPL._AC_UL320_.jpg'
),
Product(
id: '103',
title: 'BroadLink Smart Button, 3 Way Dimmer Switch Control with IFTTT and Alexa Routines for Home Automation, Wireless Trigger Sm...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61DT0NtKFrL._AC_UL320_.jpg'
),
Product(
id: '104',
title: 'Sengled Smart Light Bulbs, WiFi Light Bulbs, Alexa Light Bulb, Smart Bulbs that Work with Alexa & Google Assistant, A19 Da...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71TgS7zJ9nS._AC_UL320_.jpg'
),
Product(
id: '105',
title: 'Ceiling Fan with Lights, Indoor & Outdoor Ceiling Fan，48" Low Profile DC Smart Ceiling Fan Works with Alexa, Siri, Google ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EMgV64R6L._AC_UL320_.jpg'
),
Product(
id: '106',
title: 'Ring Indoor Cam, Compact Plug-In HD security camera with two-way talk, Works with Alexa - White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41eEWyyRfyL._AC_UL320_.jpg'
),
Product(
id: '107',
title: 'Minka-Aire F870L-TCL/DK Windmolen 65" Smart Outdoor Ceiling Fan, DC Motor, Dimmable LED Light in Textured Coal Finish Brow...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71hFliosGnL._AC_UL320_.jpg'
),
Product(
id: '108',
title: 'Chamberlain B970T Smart Garage Door Opener with Battery Backup - myQ Smartphone Controlled - Ultra Quiet, Strong Belt Driv...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51dRWnqmSoL._AC_UL320_.jpg'
),
Product(
id: '109',
title: 'Smart Plug, Outlet Extender Surge Protector Dual Smart Socket Work with Alexa and Google Home, Mini Wi-Fi Plugs Control In...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51m1s5obtQL._AC_UL320_.jpg'
),
Product(
id: '110',
title: 'Smart Power Strip, WiFi Surge Protector Work with Alexa Google Home, Smart Plug Outlets with 3 USB 3 Charging Port, Home O...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61XRgn4eBgL._AC_UL320_.jpg'
),
Product(
id: '111',
title: 'Smart Night Light Treatlife Bedside Lamp Compatible with Alexa and Google Home, Automated Schedules, APP Control Table Lam...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51YpOiCsApL._AC_UL320_.jpg'
),
Product(
id: '112',
title: 'Google Nest Learning Thermostat - Programmable Smart Thermostat for Home - 3rd Generation Nest Thermostat - Works with Ale...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71GIRQHecXL._AC_UL320_.jpg'
),
Product(
id: '113',
title: 'Wyze Cam Pan v2 1080p Pan/Tilt/Zoom Wi-Fi Indoor Smart Home Camera with Color Night Vision, 2-Way Audio, Compatible with A...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/510IqtzZ51L._AC_UL320_.jpg'
),
Product(
id: '114',
title: 'Charging Station for Multiple Devices, 6 USB Fast Ports and 6 Mixed USB Cables Included, for iPhones, Airpods, Mini iPads,...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-ssyns5OL._AC_UL320_.jpg'
),
Product(
id: '115',
title: 'Smart Light Bulbs, E26 Color Changing Alexa Light Bulb, Smart Bulbs Work with Alexa Google Home, WiFi Light Bulbs No Hub R...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61UegY-15tL._AC_UL320_.jpg'
),
Product(
id: '116',
title: 'Kasa Smart Plug Mini 15A, Smart Home Wi-Fi Outlet Works with Alexa, Google Home & IFTTT, No Hub Required, UL Certified, 2....',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51pc+pd98zL._AC_UL320_.jpg'
),
Product(
id: '117',
title: 'SwitchBot Smart Plug Mini 15A, Energy Monitor, Smart Home WiFi(2.4GHz) & Bluetooth Outlet Compatible with Alexa & Google H...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51Y22Igo0DL._AC_UL320_.jpg'
),
Product(
id: '118',
title: 'Smart Plug Compatible with Alexa & Google Assistant,Smart Outlet for Voice Control,Mini WiFi Socket with Timer Function,Re...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61Nl6kvsj8L._AC_UL320_.jpg'
),
Product(
id: '119',
title: 'Smart Plug Power Strip, WiFi Surge Protector Works with Alexa & Google Home, APP Remote Control, Timer Function, 3 Smart O...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61kBi6m1GaL._AC_UL320_.jpg'
),
Product(
id: '120',
title: 'Treatlife Smart Ceiling Fan Control, 4 Speed Fan Switch for Ceiling Fan, Neutral Wire Required, Smart Home Devices that Wo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61WAlMUTbOL._AC_UL320_.jpg'
),
Product(
id: '121',
title: 'Sunset Projection Lamp, 16 Color Sunset lamp Multiple Colors, Sunset Projecor Lamp with Remote, Color Changing Rainbow Pro...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71OxvvDodsL._AC_UL320_.jpg'
),
Product(
id: '122',
title: 'Ecoey Smart Plug - Smart Home Wi-Fi Outlet with Timing and Appointment Function, Smart Plugs with Alexa and Google Home fo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71CbB5SblCL._AC_UL320_.jpg'
),
Product(
id: '123',
title: 'Sponsored Ad - SV3CHome WiFi Deadbolt Smart Locks with Gateway, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RKI0w8ouL._AC_UL320_.jpg'
),
Product(
id: '124',
title: 'Sponsored Ad - BUTT BUDDY - Bidet Toilet Seat Attachment & Fresh Water Sprayer (Easy to Install, Universal Fit, No Plumbin...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51qGjmvol6L._AC_UL320_.jpg'
),
Product(
id: '125',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '126',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '127',
title: 'Sponsored Ad - Sense Flex Home Energy Monitor',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71IbIpAHDYL._AC_UL320_.jpg'
),
Product(
id: '128',
title: 'Sponsored Ad - Sunset Lamp Projection,16 Colors Sunset lamp with APP Remote Control/4 Modes,UFO Shape Sunset Light,Sunset ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ta0I2lNDL._AC_UL320_.jpg'
),
Product(
id: '129',
title: 'Staniot Home Security System (2nd Gen), 10 Pcs WiFi SecPanel 3 Home Wireless Alarm System Kit, 4.3" Anti-Fingerprint Touch...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/619+kXQ0amL._AC_UL320_.jpg'
),
Product(
id: '130',
title: 'Smart Plug Compatible with Alexa & Google Assistant,Smart Outlet for Voice Control,Mini WiFi Socket with Timer Function,Re...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61Nl6kvsj8L._AC_UL320_.jpg'
),
Product(
id: '131',
title: 'Kasa Smart Dimmer Switch HS220, Single Pole, Needs Neutral Wire, 2.4GHz Wi-Fi Light Switch Works with Alexa and Google Hom...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71oZlpY3p+L._AC_UL320_.jpg'
),
Product(
id: '132',
title: 'Meross Smart LED Desk Light, Metal LED Desk Lamp Works with HomeKit, Alexa and Google Home, WiFi Eye-Caring Smart LED Desk...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61mUSfZh8KS._AC_UL320_.jpg'
),
Product(
id: '133',
title: 'Kasa Smart Plug Classic 15A, Smart Home Wi-Fi Outlet Works with Alexa & Google Home, No Hub Required, UL Certified, 2.4G W...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81B+4phWROL._AC_UL320_.jpg'
),
Product(
id: '134',
title: 'Smart Ceiling Fan With Lights, Voice Control Indoor & Outdoor Ceiling Fan With 10 Speeds And Dimmable Lights, 52 Inch DC C...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51-nyH3FGUL._AC_UL320_.jpg'
),
Product(
id: '135',
title: 'Echo Dot (4th Gen) Kids + Echo Glow | Tiger',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61VB-2ruidL._AC_UL320_.jpg'
),
Product(
id: '136',
title: 'Ecoey Smart Plug - Smart Home Wi-Fi Outlet with Timing and Appointment Function, Smart Plugs with Alexa and Google Home fo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71CbB5SblCL._AC_UL320_.jpg'
),
Product(
id: '137',
title: 'Sifely Smart Lock, Smart Lock Front Door, Keyless Entry Door Lock, Smart Deadbolt, Smart Door Lock, Deadbolt Lock, Digital...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81-8IbsG8NL._AC_UL320_.jpg'
),
Product(
id: '138',
title: 'Smart Wi-Fi Light Switch Compatible with Alexa and Google Assistant 2.4Ghz, Single-Pole,Neutral Wire Required,UL Certifie...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61kXdTOHF9L._AC_UL320_.jpg'
),
Product(
id: '139',
title: 'Smart Lock,Keyless Entry Door Lock,Smart Deadbolt,Smart Door Lock,Deadbolt,Deadbolt Lock,Digital Door Lock,Keypad Deadbolt...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71hn3cs4IdL._AC_UL320_.jpg'
),
Product(
id: '140',
title: 'Sonos One 2 Pack (Gen 2) Smart Speaker with Built-in Alexa Voice Control, Wi-Fi, Black',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71WH8Q8DOPL._AC_UL320_.jpg'
),
Product(
id: '141',
title: 'Sponsored Ad - SV3CHome Deadbolt Smart Lock, Bluetooth Control, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51R2cKWDDeL._AC_UL320_.jpg'
),
Product(
id: '142',
title: 'Sponsored Ad - ROSONG Smart Sunset Lamp Projector-App-Controlled Multiple-Colors',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81DfeuiZn8L._AC_UL320_.jpg'
),
Product(
id: '143',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '144',
title: 'Level Lock Smart Lock - Touch Edition, Keyless Entry Using Touch, a Key Card, or Smartphone. Bluetooth Enabled, Works with...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71+i2eP40AL._AC_UL320_.jpg'
),
Product(
id: '145',
title: 'Door Opener WiFi Electric Swing Door,Residential Door Opener WiFi Device with WiFi Smart Home Device Workable with Alexa a...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61a2WQcNgzL._AC_UL320_.jpg'
),
Product(
id: '146',
title: 'Kasa Smart 3 Way Switch HS210 KIT, Needs Neutral Wire, 2.4GHz Wi-Fi Light Switch works with Alexa and Google Home, UL Cert...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71ywy0tUZqL._AC_UL320_.jpg'
),
Product(
id: '147',
title: 'OREiN Smart WiFi Light Bulbs, Dimmable RGBW LED Light Bulbs Color Changing Light Bulb, A19 E26 60W Equivalent, Multicolor ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ZfHz1DrxL._AC_UL320_.jpg'
),
Product(
id: '148',
title: 'Smart Plug, Lumary Smart Outlets That Work with Alexa & Google Assistant, Timer Function & Group Controller, No Hub Requir...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51+O+fuEIdL._AC_UL320_.jpg'
),
Product(
id: '149',
title: 'BroadLink Smart Button, 3 Way Dimmer Switch Control with IFTTT and Alexa Routines for Home Automation, Wireless Trigger Sm...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61DT0NtKFrL._AC_UL320_.jpg'
),
Product(
id: '150',
title: 'Carro Indoor/Outdoor Smart ceiling fan 56" 3 Blade with remote control. Works with Compatible with Alexa/Google Home/Siri,...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/616mY1MNxuS._AC_UL320_.jpg'
),
Product(
id: '151',
title: 'Kasa Outdoor Smart Plug, Smart Home Wi-Fi Outlet with 2 Sockets, IP64 Weather Resistance, Compatible with Alexa, Google Ho...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51FksYIWiSS._AC_UL320_.jpg'
),
Product(
id: '152',
title: 'HBN Smart Plug 15A, WiFi&Bluetooth Outlet Extender Dual Socket Plugs Works with Alexa, Google Home Assistant, Remote Contr...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61yED3sOQGL._AC_UL320_.jpg'
),
Product(
id: '153',
title: 'wansview Outdoor Security Camera, wansview 1080P Wireless WiFi Home Surveillance Waterproof Camera with Night Vision, Moti...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61q7uWlr21L._AC_UL320_.jpg'
),
Product(
id: '154',
title: 'U-Bolt Pro Bluetooth Enabled Fingerprint and Keypad Smart Deadbolt + Bridge WiFi Adaptor | 6-in-1 Keyless Entry | Control ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/610LcRkBXeL._AC_UL320_.jpg'
),
Product(
id: '155',
title: 'Mini Smart Plug,WiFi Socket Works with Alexa and Google Home,Surge Protector Plug-in Outlet Remote Control and Timer Funct...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51np-3RmxnL._AC_UL320_.jpg'
),
Product(
id: '156',
title: 'Sponsored Ad - ADT 6 Piece Wireless Home Security System - DIY Installation - Optional Professional Monitoring - No Contra...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41BrD8zoGiL._AC_UL320_.jpg'
),
Product(
id: '157',
title: 'Sponsored Ad - Twist to Lock deadbolt Lock keyless,Either Keeping Front Door Lock Locked as Well Unlocked Status As You Wa...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81AjcxE-ooL._AC_UL320_.jpg'
),
Product(
id: '158',
title: 'Sponsored Ad - 80ft Led Strip Lights (2 Rolls of 40ft) Keepsmile Smart App Music Sync Color Changing Led Light Strip with ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81aaB7hoRAL._AC_UL320_.jpg'
),
Product(
id: '159',
title: 'Level Lock Smart Lock, Keyless Entry, Smartphone Access, Bluetooth Enabled, Works with Apple HomeKit - Satin Chrome',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/619-ElMorBS._AC_UL320_.jpg'
),
Product(
id: '160',
title: 'OHLUX Smart WiFi LED Light Bulbs 100W Equivalent 900Lumen Compatible with Alexa Google Home Siri (No Hub Required), RGBCW ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61THDBW8b+L._AC_UL320_.jpg'
),
Product(
id: '161',
title: 'Grohe 22503LN0 Sense Guard Smart Water Controller , White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/614s491r8VL._AC_UL320_.jpg'
),
Product(
id: '162',
title: 'Emerson Sensi Wi-Fi Smart Thermostat for Smart Home, DIY, Works With Alexa, Energy Star Certified, ST55',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51WqTW-mCeL._AC_UL320_.jpg'
),
Product(
id: '163',
title: 'Smart Switch,Smart Wi-Fi Light Switch Works with Alexa and Google Assistant 2.4Ghz, Single-Pole,Neutral Wire Required,UL C...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51DVfMEpnLL._AC_UL320_.jpg'
),
Product(
id: '164',
title: 'Smart Lock Keyless Entry Deadbolt Door Locks,hornbill Smart Lock Front Door,Digital Electronic Bluetooth Deadbolt Door Loc...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61mF0qM8HTS._AC_UL320_.jpg'
),
Product(
id: '165',
title: 'SimplySmart Home PhotoShare Friends and Family Smart Digital Photo Frame, WiFi, 8 GB, Over 5,000 Photos, HD, 10.1” Black, ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81SczQ8l6zL._AC_UL320_.jpg'
),
Product(
id: '166',
title: 'Multi Plug Outlet Extender Wall Mount, USB Wall Charger with Dual Ports(2.4A Total, Smart IC), Surge Protector 1875W, 1250...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61CZeEIrf1S._AC_UL320_.jpg'
),
Product(
id: '167',
title: 'Sengled Smart Light Bulbs, WiFi Light Bulbs, Alexa Light Bulb, Smart Bulbs that Work with Alexa & Google Assistant, A19 Da...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71TgS7zJ9nS._AC_UL320_.jpg'
),
Product(
id: '168',
title: 'Kasa Smart Plug Mini, Smart Home Wi-Fi Outlet Works with Alexa & Google Home, Wi-Fi Simple Setup, No Hub Required – A Cert...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71eY0mJ81uL._AC_UL320_.jpg'
),
Product(
id: '169',
title: 'Emerson Sensi Touch Wi-Fi Smart Thermostat with Touchscreen Color Display, Works with Alexa, Energy Star Certified, C-wire...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51enaLXk6mL._AC_UL320_.jpg'
),
Product(
id: '170',
title: 'Techo Autowater B, Automatic Touchless Bathroom Faucet Adapter, Motion Sensor Adapter for Bathroom Faucets',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nAno3+HCL._AC_UL320_.jpg'
),
Product(
id: '171',
title: 'BUTT BUDDY - Bidet Toilet Seat Attachment & Fresh Water Sprayer (Easy to Install, Universal Fit, No Plumbing or Electricit...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51qGjmvol6L._AC_UL320_.jpg'
),
Product(
id: '172',
title: 'Lutron Caseta Smart Home Switch, Works with Alexa, Apple HomeKit, Google Assistant | 6-Amp, for Ceiling Fans, Exhaust Fan...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71sAvrq5stL._AC_UL320_.jpg'
),
Product(
id: '173',
title: 'Home Zone Security Smart Wireless Door, Window Sensor and Security Siren Alarm Kit - DIY APP Controlled Security Kit with ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61Hb2bVspCL._AC_UL320_.jpg'
),
Product(
id: '174',
title: 'Logitech Harmony Hub for Control of 8 Home Entertainment Devices',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61VpLBCp2cL._AC_UL320_.jpg'
),
Product(
id: '175',
title: 'Sparkleiot Zigbee Smart Plug Outlet Mini Remote Voice Control with Alexa, Compatible with Google Home SmartThings Hub Requ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51XIY6Qxe5L._AC_UL320_.jpg'
),
Product(
id: '176',
title: 'Smart Plugs, WiFi Outlet Timer Socket Sets, Remote Control Gadgets for Men, Alexa, Google Home Voice Control, 2.4GHZ Netwo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61iiSvbZc6L._AC_UL320_.jpg'
),
Product(
id: '177',
title: 'KMC 3-Outlet Wall Mount Surge Protector, 900 Joules, 4 USB 4.8 AMP USB Charging Ports, Phone Holder Cradle for Home, Schoo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61q0mhpphRL._AC_UL320_.jpg'
),
Product(
id: '178',
title: 'Lockly PGD728WSN Secure Pro Deadbolt - Smart Door Lock with Wi-Fi, Biometric Fingerprint and Digital Keypad, Works with Am...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/511xPO1Hr+L._AC_UL320_.jpg'
),
Product(
id: '179',
title: 'Kasa Smart Bulb, Full Color Changing Dimmable Smart WiFi Light Bulb Works with Alexa and Google Home, A19, 11W 1000 Lumen...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61v7NMlJiNL._AC_UL320_.jpg'
),
Product(
id: '180',
title: 'Emporia Smart Plug with Energy Monitoring | 15A Max / 10A Continuous | WiFi Smart Outlet | Emporia App | Alexa | Google | ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61c5lDCIKVL._AC_UL320_.jpg'
),
Product(
id: '181',
title: 'ecobee SmartCamera – Indoor WiFi Security Camera, Baby & Pet Monitor, Smart Home Security System, 1080p HD 180 Degree FOV,...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51VpSnIkD0L._AC_UL320_.jpg'
),
Product(
id: '182',
title: 'Skenia LED Corner Floor Lamp, RGB+Warm White Corner Lamps Floor Lamps, 16 Millions Color Changing Ambient Corner LED Light...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51sJbFRJ5xL._AC_UL320_.jpg'
),
Product(
id: '183',
title: 'Sponsored Ad - Eversecu 4CH Smart Wireless Security Camera System 4pcs 1080P 2MP Outdoor Cameras & DVR Kit Support Face Ca...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51tuDTWRlGL._AC_UL320_.jpg'
),
Product(
id: '184',
title: 'Sponsored Ad - Table-Wall LED-Lamp, Ambient Mood Lighting Lamp, Tiktok Music Sync Cool Lights Desk Decoration, RGBIC Smart...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61o9rrcpOAL._AC_UL320_.jpg'
),
Product(
id: '185',
title: 'Sponsored Ad - Sense Flex Home Energy Monitor',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71IbIpAHDYL._AC_UL320_.jpg'
),
Product(
id: '186',
title: 'Sponsored Ad - Sunset Lamp Projection,16 Colors Sunset lamp with APP Remote Control/4 Modes,UFO Shape Sunset Light,Sunset ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ta0I2lNDL._AC_UL320_.jpg'
),
Product(
id: '187',
title: 'Sponsored Ad - RGB Music Level Light Bar App Control, Rechargeable Sound Control Rhythm Light with Fragrance and clamp, 32...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-TtViPLZL._AC_UL320_.jpg'
),
Product(
id: '188',
title: 'Sponsored Ad - RGBIC Smart LED Light Bars │ Tuya WiFi + BLE (Wireless Conect) Double Mode │ Music Sync │ Dream Color │ Voi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61TCbBPD7OL._AC_UL320_.jpg'
),
Product(
id: '189',
title: 'Sengled Smart Light Bulbs, Smart Candelabra LED Bulb, Smart Chandelier Light Bulbs, 5W (40W Equivalent) 450LM, E12 Smart B...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71SsJ6kI60L._AC_UL320_.jpg'
),
Product(
id: '190',
title: 'Kasa Smart Plug Mini, Smart Home Wi-Fi Outlet Works with Alexa & Google Home, Wi-Fi Simple Setup, No Hub Required – A Cert...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71eY0mJ81uL._AC_UL320_.jpg'
),
Product(
id: '191',
title: 'Emerson Sensi Touch Wi-Fi Smart Thermostat with Touchscreen Color Display, Works with Alexa, Energy Star Certified, C-wire...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51enaLXk6mL._AC_UL320_.jpg'
),
Product(
id: '192',
title: 'Echo Frames (2nd Gen) | Smart audio glasses with Alexa | Classic Black with new blue-light-filtering lenses',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41p9-3n6J9S._AC_UL320_.jpg'
),
Product(
id: '193',
title: 'G-Homa Outdoor Smart Plug Waterproof, Bluetooth & Wi-Fi 15A Plugs with 2 Sockets, Smart Outlet Work with Alexa and Google ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71J6bbiuTTL._AC_UL320_.jpg'
),
Product(
id: '194',
title: 'Mini Security Camera- Tiny Motion Sensor Camera- Night Vision- Nanny Cam Hidden Camera- Indoor & Outdoor Camera- Smart Hom...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71JlsR3RLfL._AC_UL320_.jpg'
),
Product(
id: '195',
title: 'Techo Autowater B, Automatic Touchless Bathroom Faucet Adapter, Motion Sensor Adapter for Bathroom Faucets',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nAno3+HCL._AC_UL320_.jpg'
),
Product(
id: '196',
title: 'WiFi Door Alarm System(2nd Gen), Smart Home Alarm Security System DIY, Phone Alert, 8 Pieces-Kit (Alarm Siren, Door Window...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jGqvXgEFL._AC_UL320_.jpg'
),
Product(
id: '197',
title: 'Ring Alarm 14-piece kit (2nd Gen) – home security system with optional 24/7 professional monitoring – Works with Alexa',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41KxZL4fuRS._AC_UL320_.jpg'
),
Product(
id: '198',
title: 'Sengled Smart Light Bulbs, WiFi Light Bulbs, Alexa Light Bulb, Smart Bulbs that Work with Alexa & Google Assistant, A19 Da...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71TgS7zJ9nS._AC_UL320_.jpg'
),
Product(
id: '199',
title: 'Skenia LED Corner Floor Lamp, RGB+Warm White Corner Lamps Floor Lamps, 16 Millions Color Changing Ambient Corner LED Light...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51sJbFRJ5xL._AC_UL320_.jpg'
),
Product(
id: '200',
title: 'Kasa Smart Plug Mini 15A, Smart Home Wi-Fi Outlet Works with Alexa, Google Home & IFTTT, No Hub Required, UL Certified, 2....',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51pc+pd98zL._AC_UL320_.jpg'
),
Product(
id: '201',
title: 'Sponsored Ad - ULTRALOQ Smart Lock U-Bolt Pro, 6-in-1 Keyless Entry Door Lock with Bluetooth, Biometric Fingerprint and Ke...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61rzPSDHH0L._AC_UL320_.jpg'
),
Product(
id: '202',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '203',
title: 'Sponsored Ad - ROSONG Smart Sunset Lamp Projector-App-Controlled Multiple-Colors',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81DfeuiZn8L._AC_UL320_.jpg'
),
Product(
id: '204',
title: 'Smart Door Lock with Keypad, hornbill Smart Lock Front Door, Smart Locks Deadbolt Digital Electric Door Lock Works with Sm...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61KzkevNixS._AC_UL320_.jpg'
),
Product(
id: '205',
title: 'Smart Lock Keyless Entry Deadbolt Door Locks,hornbill Smart Lock Front Door,Digital Electronic Bluetooth Deadbolt Door Loc...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61mF0qM8HTS._AC_UL320_.jpg'
),
Product(
id: '206',
title: 'Logitech Harmony Hub for Control of 8 Home Entertainment Devices',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61VpLBCp2cL._AC_UL320_.jpg'
),
Product(
id: '207',
title: 'ULTRALOQ Smart Lock U-Bolt Pro + Bridge WiFi Adaptor, 6-in-1 Keyless Entry Door Lock with WiFi, Bluetooth, Fingerprint and...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61vIzWuAgDL._AC_UL320_.jpg'
),
Product(
id: '208',
title: 'Hifree Smart Table Lamp, Bedside Lamps for Bedrooms Compatible with Alexa and Google Home, Dimmable RGB Color Changing and...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51ywmuw+uVL._AC_UL320_.jpg'
),
Product(
id: '209',
title: 'Smart Plugs, WiFi Outlet Timer Socket Sets, Remote Control Gadgets for Men, Alexa, Google Home Voice Control, 2.4GHZ Netwo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61iiSvbZc6L._AC_UL320_.jpg'
),
Product(
id: '210',
title: 'Smart Plug, Outlet Extender Surge Protector Dual Smart Socket Work with Alexa and Google Home, Mini Wi-Fi Plugs Control In...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51m1s5obtQL._AC_UL320_.jpg'
),
Product(
id: '211',
title: 'Govee Dual Smart Plug 4 Pack, 15A WiFi Bluetooth Outlet, Work with Alexa and Google Assistant, 2-in-1 Compact Design, Gove...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51ULuz10boL._AC_UL320_.jpg'
),
Product(
id: '212',
title: 'Home Zone Security Smart Wireless Door, Window Sensor and Security Siren Alarm Kit - DIY APP Controlled Security Kit with ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61Hb2bVspCL._AC_UL320_.jpg'
),
Product(
id: '213',
title: 'Aoycocr Smart Plugs That Work with Alexa Echo Google Home for Voice Control, Smart Home Mini WiFi Outlet with Timer Remote...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ybfQmzOOL._AC_UL320_.jpg'
),
Product(
id: '214',
title: 'Smart Plug Wi-Fi Plugs Works with Alexa and Google Home, Mini Dual WiFi Outlet Extender Double Plug Surge Protector Remote...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51Kb+82J21L._AC_UL320_.jpg'
),
Product(
id: '215',
title: 'Ring Alarm 8-piece kit (2nd Gen) – home security system with optional 24/7 professional monitoring – Works with Alexa',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41w0DrWsxLL._AC_UL320_.jpg'
),
Product(
id: '216',
title: 'Sponsored Ad - SV3CHome Deadbolt Smart Lock, Bluetooth Control, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51R2cKWDDeL._AC_UL320_.jpg'
),
Product(
id: '217',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '218',
title: 'Sponsored Ad - Twist to Lock deadbolt Lock keyless,Either Keeping Front Door Lock Locked as Well Unlocked Status As You Wa...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81AjcxE-ooL._AC_UL320_.jpg'
),
Product(
id: '219',
title: 'Treatlife Smart Ceiling Fan Control, 4 Speed Fan Switch for Ceiling Fan, Neutral Wire Required, Smart Home Devices that Wo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61WAlMUTbOL._AC_UL320_.jpg'
),
Product(
id: '220',
title: 'Smart Plug Power Strip, WiFi Surge Protector Works with Alexa & Google Home, APP Remote Control, Timer Function, 3 Smart O...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61kBi6m1GaL._AC_UL320_.jpg'
),
Product(
id: '221',
title: 'Smart Light Bulbs, E26 Color Changing Alexa Light Bulb, Smart Bulbs Work with Alexa Google Home, WiFi Light Bulbs No Hub R...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61UegY-15tL._AC_UL320_.jpg'
),
Product(
id: '222',
title: 'SimplySmart Home PhotoShare Friends and Family Smart Digital Photo Frame, WiFi, 8 GB, Over 5,000 Photos, HD, 10.1” Black, ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81SczQ8l6zL._AC_UL320_.jpg'
),
Product(
id: '223',
title: 'Echo Studio - High-fidelity smart speaker with 3D audio and Alexa',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/717UtYBmbfL._AC_UL320_.jpg'
),
Product(
id: '224',
title: 'Star Projector, Galaxy Projector Work with Alexa Google Assistant, Night Light Projector with Bluetooth Music Speaker, for...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71swlidSDFL._AC_UL320_.jpg'
),
Product(
id: '225',
title: 'Diaotec Smart Plug - Mini WiFi Smart Outlet Plugs Work with Alexa and Google Home for Voice Control, Remote Control Smart ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51fhr0N5c8L._AC_UL320_.jpg'
),
Product(
id: '226',
title: 'Sengled Zigbee Smart Bulb, Smart Hub Required, Works with SmartThings and Echo with built-in Hub, Voice Control with Alexa...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41PhUwbDgML._AC_UL320_.jpg'
),
Product(
id: '227',
title: 'Bose Home Speaker 300: Bluetooth Smart Speaker with Amazon Alexa Built-in, Silver',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71-Di+XiEUL._AC_UL320_.jpg'
),
Product(
id: '228',
title: 'Staniot Home Security System (2nd Gen), 10 Pcs WiFi SecPanel 3 Home Wireless Alarm System Kit, 4.3" Anti-Fingerprint Touch...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/619+kXQ0amL._AC_UL320_.jpg'
),
Product(
id: '229',
title: 'Smart Light Bulb, meross Dimmable WiFi LED Bulb Compatible with Apple HomeKit, Siri, Alexa, Google Home, SmartThings, A19 ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RlVY3TJXL._AC_UL320_.jpg'
),
Product(
id: '230',
title: 'Security Camera 2K, blurams Baby Monitor Dog Camera 360-degree for Home Security w/ Smart Motion Tracking, Phone App, IR N...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/514Q-oBHk7L._AC_UL320_.jpg'
),
Product(
id: '231',
title: 'Natural Gas Detector Alarm,WI-FI Smart App, UL -1484 Standards Propane Leak Monitor for Home, Kitchen, Camper, Trailer, R...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51AvDDq5u3L._AC_UL320_.jpg'
),
Product(
id: '232',
title: 'Smart Power Strip, WiFi Surge Protector Work with Alexa Google Home, Smart Plug Outlets with 3 USB 3 Charging Port, Home O...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61XRgn4eBgL._AC_UL320_.jpg'
),
Product(
id: '233',
title: 'Sengled Alexa Light Bulb, WiFi Light Bulbs No Hub Required, Smart Bulbs that Work with Alexa, Google Home, Dimmable Smart ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ju+OBNspS._AC_UL320_.jpg'
),
Product(
id: '234',
title: 'Sunset Projection Lamp, 16 Color Sunset lamp Multiple Colors, Sunset Projecor Lamp with Remote, Color Changing Rainbow Pro...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71OxvvDodsL._AC_UL320_.jpg'
),
Product(
id: '235',
title: 'myQ Chamberlain Smart Garage Control - Wireless Garage Hub and Sensor with Wifi & Bluetooth - Smartphone Controlled, myQ-G...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51U402oH80L._AC_UL320_.jpg'
),
Product(
id: '236',
title: 'Mini Smart Plug,WiFi Socket Works with Alexa and Google Home,Surge Protector Plug-in Outlet Remote Control and Timer Funct...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51np-3RmxnL._AC_UL320_.jpg'
),
Product(
id: '237',
title: 'BearDot Mini Wifi Smart Plug, Compatible with Alexa and Google Home, Smart Home Devices that Connect with Alexa and Google...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61MaaESKkWL._AC_UL320_.jpg'
),
Product(
id: '238',
title: 'TJOY Alexa Smart Light Bulbs 12 Pack, WiFi Led Light Bulb Work with Alexa&Google Home, Dimmable RGB Color Changing 2700-65...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71p+7k2OFeL._AC_UL320_.jpg'
),
Product(
id: '239',
title: 'Philips Hue White Base Lumen (60W) Smart Button Starter Kit, 16 Millions Colors, Works with Amazon Alexa, Google Assistan...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/611MIY7ylZL._AC_UL320_.jpg'
),
Product(
id: '240',
title: 'Emporia Smart Plug with Energy Monitoring | 15A Max / 10A Continuous | WiFi Smart Outlet | Emporia App | Alexa | Google | ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61c5lDCIKVL._AC_UL320_.jpg'
),
Product(
id: '241',
title: 'Echo Dot (4th Gen) Kids + Echo Glow | Tiger',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61VB-2ruidL._AC_UL320_.jpg'
),
Product(
id: '242',
title: 'Smart Switch,Smart Wi-Fi Light Switch Works with Alexa and Google Assistant 2.4Ghz, Single-Pole,Neutral Wire Required,UL C...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51DVfMEpnLL._AC_UL320_.jpg'
),
Product(
id: '243',
title: 'Sponsored Ad - Table-Wall LED-Lamp, Ambient Mood Lighting Lamp, Tiktok Music Sync Cool Lights Desk Decoration, RGBIC Smart...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61o9rrcpOAL._AC_UL320_.jpg'
),
Product(
id: '244',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '245',
title: 'Sponsored Ad - Sunset Lamp Projection,16 Colors Sunset lamp with APP Remote Control/4 Modes,UFO Shape Sunset Light,Sunset ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ta0I2lNDL._AC_UL320_.jpg'
),
Product(
id: '246',
title: 'Sponsored Ad - RGB Music Level Light Bar App Control, Rechargeable Sound Control Rhythm Light with Fragrance and clamp, 32...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-TtViPLZL._AC_UL320_.jpg'
),
Product(
id: '247',
title: 'Sponsored Ad - Electric Can Opener - Vcwtty One Touch Switch Smooth Edge Automatic Electric Can Opener for Any Size, Kitch...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71CDrRTaCaL._AC_UL320_.jpg'
),
Product(
id: '248',
title: 'Sponsored Ad - SV3CHome Deadbolt Smart Lock, Bluetooth Control, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51R2cKWDDeL._AC_UL320_.jpg'
),
Product(
id: '249',
title: 'Philips Hue White Base Lumen (60W) Smart Button Starter Kit, 16 Millions Colors, Works with Amazon Alexa, Google Assistan...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/611MIY7ylZL._AC_UL320_.jpg'
),
Product(
id: '250',
title: 'wansview Outdoor Security Camera, wansview 1080P Wireless WiFi Home Surveillance Waterproof Camera with Night Vision, Moti...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61q7uWlr21L._AC_UL320_.jpg'
),
Product(
id: '251',
title: 'USB&Type-C 2.4A 5V Fast Charging Smart Plug 15A Work with Alexa,Google Home Assistant Nest,Compatible Wireless&Bluetooth,V...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/21nRezbKtrL._AC_UL320_.jpg'
),
Product(
id: '252',
title: 'Sponsored Ad - Linksys EA7500-4B Max-Stream WiFi 5 Router: AC1900, Dual-Band Wireless Home Network, Gaming & Streaming, Gi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/616itTrf7PL._AC_UL320_.jpg'
),
Product(
id: '253',
title: 'Sponsored Ad - Pocketalk Classic Language Translator Device - Portable Two-Way Voice Interpreter - 82 Language Smart Trans...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/515RbJ0EsQS._AC_UL320_.jpg'
),
Product(
id: '254',
title: 'Sponsored Ad - Link Dream Bluetooth Earpiece for Cell Phone Hands Free Wireless Headset Noise Cancelling Mic 24Hrs Talking...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rqivOcLML._AC_UL320_.jpg'
),
Product(
id: '255',
title: 'Sponsored Ad - Daytech Caregiver Pager System Call Button Personal Alert Pager for Home Elderly Attendant Patient Nurses S...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rUqXE7azL._AC_UL320_.jpg'
),
Product(
id: '256',
title: 'Sponsored Ad - Linksys AX1800 Wi-Fi 6 Router Home Networking, Dual Band Wireless AX Gigabit WiFi Router, Speeds up to 1.8 ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51cX+qc4z-L._AC_UL320_.jpg'
),
Product(
id: '257',
title: 'Diffith Smart Light Bulbs No Hub Required Color Changing Light Bulb That Work with Alexa & Google Home Alexa Light Bulb Di...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/618gIqmOj0L._AC_UL320_.jpg'
),
Product(
id: '258',
title: 'Echo Dot (4th Gen) | Glacier White with Sengled Bluetooth Color bulb | Alexa smart home starter kit',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71PG9ccrK+S._AC_UL320_.jpg'
),
Product(
id: '259',
title: 'SMAAIR 52 Inch Smart Ceiling Fan with Lights, 10-speed DC Motor Ceiling Fan Works with Remote Control/Alexa/Google Home/Si...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51KHH0PRy2L._AC_UL320_.jpg'
),
Product(
id: '260',
title: 'Ezlo Plus Smart Home Hub with Zigbee, Z-Wave - Control Smart Bulbs, Smart Locks, Motion Sensors, and Cameras',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41Rgoo1ej7S._AC_UL320_.jpg'
),
Product(
id: '261',
title: 'Mini Smart Plug, Smart Home Wi-Fi Plug Work with Alexa and Google Home, Surge Protector Remote & Voice Control Smart Outle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51ysj754HrL._AC_UL320_.jpg'
),
Product(
id: '262',
title: 'Pocketalk Classic Language Translator Device - Portable Two-Way Voice Interpreter - 82 Language Smart Translations in Real...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51KUK6lnS9L._AC_UL320_.jpg'
),
Product(
id: '263',
title: 'Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Lights Works with...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '264',
title: 'Smart Light Bulb, meross Smart WiFi LED Bulbs Compatible with Apple HomeKit, Siri, Alexa, Google Assistant and SmartThing...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61tOi1OaOFL._AC_UL320_.jpg'
),
Product(
id: '265',
title: 'Sengled Smart Light Bulbs, Smart Candelabra LED Bulb, Smart Chandelier Light Bulbs, 5W (40W Equivalent) 450LM, E12 Smart B...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71SsJ6kI60L._AC_UL320_.jpg'
),
Product(
id: '266',
title: 'Sponsored Ad - ULTRALOQ Smart Lock U-Bolt Pro, 6-in-1 Keyless Entry Door Lock with Bluetooth, Biometric Fingerprint and Ke...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61rzPSDHH0L._AC_UL320_.jpg'
),
Product(
id: '267',
title: 'Sponsored Ad - 80ft Led Strip Lights (2 Rolls of 40ft) Keepsmile Smart App Music Sync Color Changing Led Light Strip with ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81aaB7hoRAL._AC_UL320_.jpg'
),
Product(
id: '268',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '269',
title: 'Loefme Smart Light Bars, RGBICWW Smart LED Lights with 15 Scene Modes and 4 Music Modes, Bluetooth Color Light Bar for Ent...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/615VORRYdSL._AC_UL320_.jpg'
),
Product(
id: '270',
title: 'Smarturns Vertical Knobs, Intelligent knobs for Both Gas and Electrical stoves (4-knobs Package Vertical only), Smart Aler...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RtiLZNakS._AC_UL320_.jpg'
),
Product(
id: '271',
title: 'Echo Dot (4th Gen) | Charcoal with Sengled Bluetooth Color bulb | Alexa smart home starter kit',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81r-WmLEyMS._AC_UL320_.jpg'
),
Product(
id: '272',
title: 'MOES Tuya ZigBee Wireless 12 Scene Switch Push Button Tuya ZigBee Hub Required, Battery Powered（Batteries Not Included）, S...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/510x2m9xcWL._AC_UL320_.jpg'
),
Product(
id: '273',
title: 'Smart Switch by Martin Jerry, Single Pole, Smart Home Devices That Work with Alexa, 2.4G WiFi, Need Neutral Wire, Not Dimmer',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EAWcVu7-L._AC_UL320_.jpg'
),
Product(
id: '274',
title: 'Sengled Smart Light Bulbs, Smart Bulbs That Work with Alexa and Google Home, Alexa Light Bulb No Hub Required, WiFi Light ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/611Snu9aNRL._AC_UL320_.jpg'
),
Product(
id: '275',
title: 'Wyze Plug, 2.4GHz WiFi Smart Plug, Works with Alexa, Google Assistant, IFTTT, No Hub Required, One-Pack, White – A Certifi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/419XPu8CG+L._AC_UL320_.jpg'
),
Product(
id: '276',
title: 'TV OFFER - Alexa smart home - Starter Kit - Charcoal',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51sbibcRgkL._AC_UL320_.jpg'
),
Product(
id: '277',
title: 'Smart Light Bulbs 2 Packs，Smart Light Bulbs That Compatible with Alexa and Google Home, Wi-Fi Led 800 Lumens 2700K Warm Wh...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61uAsa4f8aL._AC_UL320_.jpg'
),
Product(
id: '278',
title: 'SimpliSafe 12 Piece Wireless Home Security System w/HD Camera - Optional 24/7 Professional Monitoring - No Contract - Comp...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61KOJkcD1TL._AC_UL320_.jpg'
),
Product(
id: '279',
title: 'AMBER X Smart Personal Cloud Storage Device for Data and Media Files, 512GB High-Speed SSD, 6 Core ARM Processor, iOS/Andr...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/711dvRQcdZL._AC_UL320_.jpg'
),
Product(
id: '280',
title: 'BN-LINK WiFi Heavy Duty Smart Plug Outlet, No Hub Required with Timer Function, White, Compatible with Alexa and Google As...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51FBwIGdfRS._AC_UL320_.jpg'
),
Product(
id: '281',
title: 'Sponsored Ad - ROSONG Smart Sunset Lamp Projector-App-Controlled Multiple-Colors',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81DfeuiZn8L._AC_UL320_.jpg'
),
Product(
id: '282',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '283',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '284',
title: 'Google Nest Thermostat - Smart Thermostat for Home - Programmable Wifi Thermostat - Snow',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51VgAeyA7HL._AC_UL320_.jpg'
),
Product(
id: '285',
title: 'ADT 6 Piece Wireless Home Security System - DIY Installation - Optional Professional Monitoring - No Contract - Compatible...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41i2TqQGRJL._AC_UL320_.jpg'
),
Product(
id: '286',
title: 'JJC Smart Plug 18D, WiFi Outlet Compatible with Alexa and Google Home Assistant, Mini Smart Home Plugs with Timer Fuction...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RQds+mOmL._AC_UL320_.jpg'
),
Product(
id: '287',
title: 'Smart Plug,Wi-Fi Outlet Extender Surge Protector Dual Smart Socket Work with Alexa and Google Home, Mini Plugs Control Ind...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51eZO4uVjSL._AC_UL320_.jpg'
),
Product(
id: '288',
title: 'AC Charger Compatible with Google Home/Nest Hub 1 and 2 Generation Smart Speaker Wall Power Supply Adapter Cord',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ZKiT5Zi-L._AC_UL320_.jpg'
),
Product(
id: '289',
title: 'BroadLink NFC Tags, NXP NTAG215 Waterproof NFC Tag Sticker, Trigger Home Automation Devices and Scenes, Compatible with Al...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51oOXQe3EIL._AC_UL320_.jpg'
),
Product(
id: '290',
title: 'BN-LINK WiFi Smart in-Wall Light Switch, No Hub Required with Timer Function, White, Compatible with Alexa and Google Assi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51N+pEdCETL._AC_UL320_.jpg'
),
Product(
id: '291',
title: 'CallToU Wireless Caregiver Pager Smart Call System 2 SOS Call Buttons/Transmitters 2 Receivers Nurse Calling Alert Patient...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61pSnwaZ9yL._AC_UL320_.jpg'
),
Product(
id: '292',
title: 'Smart Light Bulbs, Color Changing Light Bulb, E26 Smart Bulbs That Work with Alexa and Google Home No Hub Required, WiFi L...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61BlxUSvFIL._AC_UL320_.jpg'
),
Product(
id: '293',
title: 'Kasa Smart Light Bulbs that works with Alexa and Google Home, Dimmable Smart LED Bulb, A19, 9W, 800Lumens, Soft White(2700...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51JwYoZz9wL._AC_UL320_.jpg'
),
Product(
id: '294',
title: 'TODAAIR Smart Light Bulbs 1 Pack, Bluetooth & WiFi RGB+White Color Changing Dimmable 60W Equivalent E27 LED Light Bulbs A1...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nO6NDyJiL._AC_UL320_.jpg'
),
Product(
id: '295',
title: 'Alexa Smart Plugs, WiFi Smart Power Strip Surge Protector Compatible with Alexa Echo and Google Home, No Hub Required, Sma...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41yziLfYkZL._AC_UL320_.jpg'
),
Product(
id: '296',
title: 'OUVOPO Wireless Home Security System 7 Piece, WiFi Smart Door Alarm with App Alert, No Contract , Work with Alexa, DIY Ala...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61oYRbwME6L._AC_UL320_.jpg'
),
Product(
id: '297',
title: 'Smart Bulbs Works with Apple HomeKit, Color Changing Smart Light Bulbs Compatible with Siri, Alexa and Google Home, A19 LE...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RkY8z68VL._AC_UL320_.jpg'
),
Product(
id: '298',
title: 'Smart Power Strip Wifi Smart Plug Compatible with Alexa Outlet and Google Home Remote Control and App Control Your Device ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51gMBLJnDSL._AC_UL320_.jpg'
),
Product(
id: '299',
title: 'Ecoey WiFi Smoke Detector , WiFi Smoke Alarm with Photoelectric Technology and LED , Smoke Alarm with Test&Silence Functio...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61YRU7KFEjL._AC_UL320_.jpg'
),
Product(
id: '300',
title: 'Wolverine TransMedia- Home Movie Digitizer - Preserve Your Old Videos from Camcorders, VCR’s and DVD’s into Digital Format...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51VylzhSgWL._AC_UL320_.jpg'
),
Product(
id: '301',
title: 'Hidden Camera USB Charger Spy Camera WiFi Recording Device Home Security Full HD 1080 Surveillance USB Smart Charger Tiny ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61pQfqyH2fL._AC_UL320_.jpg'
),
Product(
id: '302',
title: 'SwitchBot Hub Mini Smart Remote - IR Blaster, Link SwitchBot to Wi-Fi (Support 2.4GHz), Control TV, Air Conditioner, Compa...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/516p7u9mbSS._AC_UL320_.jpg'
),
Product(
id: '303',
title: 'Amazon Smart Home Bundle: Echo Show 5, Ring Stick Up Cam (Battery), Echo Dot (3rd Gen), and Amazon Smart Plug',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51ld6xtBoBL._AC_UL320_.jpg'
),
Product(
id: '304',
title: 'Brilliant Smart Dimmer Switch (White) — Compatible with Alexa, Google Assistant, Apple HomeKit, Hue, LIFX, SmartThings, T...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51J7RxCa6QL._AC_UL320_.jpg'
),
Product(
id: '305',
title: 'Geeni Outdoor Duo Wi-Fi Smart Plug, Weatherproof, No Hub Required, Wireless Remote Control and Timer -Smart Plug Compatibl...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71n9+SHW0GL._AC_UL320_.jpg'
),
Product(
id: '306',
title: 'GE CYNC Smart LED Light Bulbs, Bluetooth and Wi-Fi Enabled, Alexa and Google Assistant Compatible, Soft White, Dimmable, S...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71eixZadKoL._AC_UL320_.jpg'
),
Product(
id: '307',
title: 'Treatlife Tuya Zigbee 3.0 Hub Gateway, 2.4 Ghz WiFi Smart Home Hub, APP Remote Control, Smart Hub Compatible with Alexa & ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/412X6onqv0L._AC_UL320_.jpg'
),
Product(
id: '308',
title: 'Sponsored Ad - Eversecu 4CH Smart Wireless Security Camera System 4pcs 1080P 2MP Outdoor Cameras & DVR Kit Support Face Ca...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51tuDTWRlGL._AC_UL320_.jpg'
),
Product(
id: '309',
title: 'Sponsored Ad - RGBIC Smart LED Light Bars │ Tuya WiFi + BLE (Wireless Conect) Double Mode │ Music Sync │ Dream Color │ Voi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61TCbBPD7OL._AC_UL320_.jpg'
),
Product(
id: '310',
title: 'Sponsored Ad - Sense Flex Home Energy Monitor',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71IbIpAHDYL._AC_UL320_.jpg'
),
Product(
id: '311',
title: 'Sponsored Ad - OKOOI White Table Lamps for Office Dual AC Outlet Small Table Lamps with USB Ports Bedside Table Lamps Mode...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/617hYzQjvfL._AC_UL320_.jpg'
),
Product(
id: '312',
title: 'Sponsored Ad - RGB Music Level Light Bar App Control, Rechargeable Sound Control Rhythm Light with Fragrance and clamp, 32...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61-TtViPLZL._AC_UL320_.jpg'
),
Product(
id: '313',
title: 'Sponsored Ad - Sunset Lamp Projection,16 Colors Sunset lamp with APP Remote Control/4 Modes,UFO Shape Sunset Light,Sunset ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ta0I2lNDL._AC_UL320_.jpg'
),
Product(
id: '314',
title: 'Lutron Caseta Wireless Smart Lighting Dimmer Switch and Remote Kit for Wall & Ceiling Lights, P-PKG1W-WH, White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/519ZmbJcbTL._AC_UL320_.jpg'
),
Product(
id: '315',
title: 'ADT 6 Piece Wireless Home Security System - DIY Installation - Optional Professional Monitoring - No Contract - Compatible...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41i2TqQGRJL._AC_UL320_.jpg'
),
Product(
id: '316',
title: 'Smart Light Bulbs,Marctronic Color Changing Smart Bulbs Work with Alexa Google Home,Hue Lights No Hub Required,Dimmable Sm...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/619tTf0Uw3L._AC_UL320_.jpg'
),
Product(
id: '317',
title: 'Diffith Smart Light Bulbs No Hub Required Color Changing Light Bulb That Work with Alexa & Google Home Alexa Light Bulb Di...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/618gIqmOj0L._AC_UL320_.jpg'
),
Product(
id: '318',
title: 'BN-LINK WiFi Smart in-Wall Light Switch, No Hub Required with Timer Function, White, Compatible with Alexa and Google Assi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51N+pEdCETL._AC_UL320_.jpg'
),
Product(
id: '319',
title: 'Smart Switch by Martin Jerry, Single Pole, Smart Home Devices That Work with Alexa, 2.4G WiFi, Need Neutral Wire, Not Dimmer',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EAWcVu7-L._AC_UL320_.jpg'
),
Product(
id: '320',
title: 'Lutron Caseta Wireless Single-Pole/3-Way Smart Lighting Lamp Dimmer and Remote Kit | P-PKG1P-WH | White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EHy13Lf5L._AC_UL320_.jpg'
),
Product(
id: '321',
title: 'Smart Lock, SMONET Deadbolt Lock with Keypad, Keyless Entry Biometric Fingerprint Front Door Locks, Bluetooth Electronic D...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/618hWK1zCHL._AC_UL320_.jpg'
),
Product(
id: '322',
title: 'Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Lights Works with...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '323',
title: 'ANTELA Smart Door Sensor WiFi Window Door Security Home Alarm Sensors Devices No Hub Smart Life App Compatible Devices Doo...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51a3SjL0cxL._AC_UL320_.jpg'
),
Product(
id: '324',
title: 'Jardhom Smart Light Bulbs, RGBW Wi-Fi Color Changing Led Bulb Compatible with Alexa & Google Home Assistant,E26 24W(250W E...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51r0G1VvPUL._AC_UL320_.jpg'
),
Product(
id: '325',
title: 'BN-LINK WiFi Heavy Duty Smart Plug Outlet, No Hub Required with Timer Function, White, Compatible with Alexa and Google As...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51FBwIGdfRS._AC_UL320_.jpg'
),
Product(
id: '326',
title: 'Sponsored Ad - ULTRALOQ Smart Lock U-Bolt Pro, 6-in-1 Keyless Entry Door Lock with Bluetooth, Biometric Fingerprint and Ke...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61rzPSDHH0L._AC_UL320_.jpg'
),
Product(
id: '327',
title: 'Sponsored Ad - SV3CHome Deadbolt Smart Lock, Bluetooth Control, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51R2cKWDDeL._AC_UL320_.jpg'
),
Product(
id: '328',
title: 'Sponsored Ad - ROSONG Smart Sunset Lamp Projector-App-Controlled Multiple-Colors',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81DfeuiZn8L._AC_UL320_.jpg'
),
Product(
id: '329',
title: 'Kasa Smart LED Light Strip, 16.4ft WiFi LED Strip Works with Alexa, Google Home, SmartThings, High Brightness with 16 Mill...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ul+J5L+FL._AC_UL320_.jpg'
),
Product(
id: '330',
title: 'Smart Plug,Wi-Fi Outlet Extender Surge Protector Dual Smart Socket Work with Alexa and Google Home, Mini Plugs Control Ind...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51eZO4uVjSL._AC_UL320_.jpg'
),
Product(
id: '331',
title: 'JJC Smart Plug 18D, WiFi Outlet Compatible with Alexa and Google Home Assistant, Mini Smart Home Plugs with Timer Fuction...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RQds+mOmL._AC_UL320_.jpg'
),
Product(
id: '332',
title: 'ORVIBO Smart IR Remote Control, WiFi Universal Smart Home Hub, IR Blaster, Works with Alexa, Google Home, Siri, Voice Cont...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51VNRKGjELL._AC_UL320_.jpg'
),
Product(
id: '333',
title: 'Hidden Camera USB Charger Spy Camera WiFi Recording Device Home Security Full HD 1080 Surveillance USB Smart Charger Tiny ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61pQfqyH2fL._AC_UL320_.jpg'
),
Product(
id: '334',
title: 'Ooma Telo Free Home Phone Service. Works with Amazon Echo and Smart Devices (Renewed)',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61r-e9iNbAL._AC_UL320_.jpg'
),
Product(
id: '335',
title: 'WiFi Door Lock, Keyless Entry, Smart Digital Door Lock for Front Door with Deadbolt, APP Remote Control, Biometric Fingerp...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61v+myNOgFL._AC_UL320_.jpg'
),
Product(
id: '336',
title: 'Smart Table Lamps - LED Night Light Table Lamps Bedside Lamp for Bedrooms, Night Lamp with 16 M Colors Design for Bedrooms...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61v8ChoMyLL._AC_UL320_.jpg'
),
Product(
id: '337',
title: 'SINGCALL Tuya WiFi Smart Wireless Caregiver Pager Calling System Nurse Calling Alert Pager System for Home Elderly Patient...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51+XpvmoIQL._AC_UL320_.jpg'
),
Product(
id: '338',
title: 'Wifi Smart Socket,Smart Plug,Smart life WiFi Plug,Outlet Compatible with Alexa and Google Home,Only 2.4G WiFi, No Need Hu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41u88+dmRyL._AC_UL320_.jpg'
),
Product(
id: '339',
title: 'KMC Smart Tap 2-Pack, 4-Outlet Smart Plug WiFi Outlet Wall Tap, Energy Monitoring, Works with Alexa and Google Home, Remot...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ZVEusyOmL._AC_UL320_.jpg'
),
Product(
id: '340',
title: 'WiFi Range Extender Signal Booster up to 5000sq.ft and 40 Devices, Internet Booster for Home, Wireless Internet Repeater a...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EnqQecXWS._AC_UL320_.jpg'
),
Product(
id: '341',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '342',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '343',
title: 'Sponsored Ad - Eversecu 4CH Smart Wireless Security Camera System 4pcs 1080P 2MP Outdoor Cameras & DVR Kit Support Face Ca...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51tuDTWRlGL._AC_UL320_.jpg'
),
Product(
id: '344',
title: 'Smarturns Vertical Knobs, Intelligent knobs for Both Gas and Electrical stoves (4-knobs Package Vertical only), Smart Aler...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RtiLZNakS._AC_UL320_.jpg'
),
Product(
id: '345',
title: '4 Pack Smart Light Bulbs That Work with Alexa and Google Home Dimmable, Warm to Cool White Color Changing WiFi LED Bulbs w...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61K+iimIx3L._AC_UL320_.jpg'
),
Product(
id: '346',
title: 'All New Echo 4th Gen with Ring Stick Up Cam Battery White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/613Mmu12d0S._AC_UL320_.jpg'
),
Product(
id: '347',
title: 'TECSZN Smart IR Remote Control Smart Home Automation Work with Alexa and Google Home Universal Inferred Smart IR TUYA Wire...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/510m10IrOXS._AC_UL320_.jpg'
),
Product(
id: '348',
title: 'Honeywell Home T9 WiFi Smart Thermostat with 1 Smart Room Sensor, Touchscreen Display, Alexa and Google Assist',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71p8+UtIHpL._AC_UL320_.jpg'
),
Product(
id: '349',
title: 'RGB Light Bars, Smart LED Lights with App Control, Sync with Music, Multiple Scene and Music Modes, Work with Alexa & Goog...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61iBt6H1HbL._AC_UL320_.jpg'
),
Product(
id: '350',
title: 'BroadLink NFC Tags, NXP NTAG215 Waterproof NFC Tag Sticker, Trigger Home Automation Devices and Scenes, Compatible with Al...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51oOXQe3EIL._AC_UL320_.jpg'
),
Product(
id: '351',
title: 'WiFi Range Extender, 1200Mbps Wireless Signal Repeater Booster, Dual Band 2.4G and 5G Expander, 4 Antennas 360° Full Cover...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51thkM2INqL._AC_UL320_.jpg'
),
Product(
id: '352',
title: 'Smart Light Bulbs RGB Color Light Bulb WiFi Smart Bulbs Work with Alexa Echo Google Home Smart Things No Hub Required Dimm...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61w8qDadtxS._AC_UL320_.jpg'
),
Product(
id: '353',
title: 'Echo Dot (4th Gen) with Clock | Twilight Blue with Sengled Bluetooth Color bulb | Alexa smart home starter kit',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81cgyvKpajS._AC_UL320_.jpg'
),
Product(
id: '354',
title: 'Smart WiFi Alexa Light Bulb, Peteme Led RGB Color Changing Bulbs, Compatible with Alexa, Siri, Echo, Google Home (No Hub R...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ZHKtKVCGL._AC_UL320_.jpg'
),
Product(
id: '355',
title: 'Smart Bulbs Works with Apple HomeKit, Color Changing Smart Light Bulbs Compatible with Siri, Alexa and Google Home, A19 LE...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61RkY8z68VL._AC_UL320_.jpg'
),
Product(
id: '356',
title: 'OUVOPO Wireless Home Security System 7 Piece, WiFi Smart Door Alarm with App Alert, No Contract , Work with Alexa, DIY Ala...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61oYRbwME6L._AC_UL320_.jpg'
),
Product(
id: '357',
title: 'Ecoey WiFi Smoke Detector , WiFi Smoke Alarm with Photoelectric Technology and LED , Smoke Alarm with Test&Silence Functio...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61YRU7KFEjL._AC_UL320_.jpg'
),
Product(
id: '358',
title: 'Smart Power Strip Wifi Smart Plug Compatible with Alexa Outlet and Google Home Remote Control and App Control Your Device ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51gMBLJnDSL._AC_UL320_.jpg'
),
Product(
id: '359',
title: 'Geeni Outdoor Duo Wi-Fi Smart Plug, Weatherproof, No Hub Required, Wireless Remote Control and Timer -Smart Plug Compatibl...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71n9+SHW0GL._AC_UL320_.jpg'
),
Product(
id: '360',
title: 'Smart Light Bulb, meross Smart WiFi LED Bulbs Compatible With Apple HomeKit, Siri, Alexa, Google Assistant and SmartThing...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61LycnWf3EL._AC_UL320_.jpg'
),
Product(
id: '361',
title: 'LED Floor Lamp Corner Lamp for Living Room, RGB Lamp for Bedroom Led Corner Floor Lamp Color Chaning, Standing Lamps with ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EYcGPbavL._AC_UL320_.jpg'
),
Product(
id: '362',
title: 'Lenovo Smart Tab M10 Plus, FHD Android Tablet, Alexa-Enabled Smart Device, Octa-Core Processor, 128GB Storage, 4GB RAM, Wi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81T2hqIGyJL._AC_UL320_.jpg'
),
Product(
id: '363',
title: 'Smart IR Remote Control Tuya APP WiFi Compatible with Alexa and Google Home Smart Control Infrared Universal Remote Blaste...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41oSaF0rUeL._AC_UL320_.jpg'
),
Product(
id: '364',
title: 'LOQRON Fingerprint Smart Door Lock, Security Keyless Entry Door Lock with Reversible Handle, Weatherproof Electronic Deadb...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61ycWfGkjjL._AC_UL320_.jpg'
),
Product(
id: '365',
title: 'Keyless Entry Door Lock,Keypad Entry Door Lock,Fingerprint Door Lock,Keypad Deadbolt Lock,Smart Lock Front Door,Automatic ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71ty9j-nKmL._AC_UL320_.jpg'
),
Product(
id: '366',
title: 'Smart LED Moon Lamp, 3 Types of control modes - Wifi / App / IR Control, 5.9 Inch Touch Night Light RGB Color Changing Led...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/6171YgErbKL._AC_UL320_.jpg'
),
Product(
id: '367',
title: 'D-Link AC1200 Dual-Band Wi-Fi Range Extender/Wireless Repeater/Access Point for Best Wi-Fi Coverage for Smart Home and Ale...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51otb9rcfQL._AC_UL320_.jpg'
),
Product(
id: '368',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '369',
title: 'Sponsored Ad - RGBIC Smart LED Light Bars │ Tuya WiFi + BLE (Wireless Conect) Double Mode │ Music Sync │ Dream Color │ Voi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61TCbBPD7OL._AC_UL320_.jpg'
),
Product(
id: '370',
title: 'Sponsored Ad - Sense Flex Home Energy Monitor',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71IbIpAHDYL._AC_UL320_.jpg'
),
Product(
id: '371',
title: 'Sponsored Ad - 2022 Newest WiFi Extender,WiFi Booster,WiFi Repeater ,Covers Up to 2640sq.ft and 25 Devicse,Internet Booste...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51TcXyxgdKL._AC_UL320_.jpg'
),
Product(
id: '372',
title: 'Sponsored Ad - RGBIC Smart LED Light Bars │ Tuya WiFi + BLE (Wireless Conect) Double Mode │ Music Sync │ Dream Color │ Voi...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61TCbBPD7OL._AC_UL320_.jpg'
),
Product(
id: '373',
title: 'Sponsored Ad - OKOOI White Table Lamps for Office Dual AC Outlet Small Table Lamps with USB Ports Bedside Table Lamps Mode...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/617hYzQjvfL._AC_UL320_.jpg'
),
Product(
id: '374',
title: 'August Smart Lock Pro + Connect Hub - Wi-Fi Smart Lock for Keyless Entry - Works with Alexa, Google Assistant, and more – ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51Lm7sw46GL._AC_UL320_.jpg'
),
Product(
id: '375',
title: 'YI Home Security Camera Surveillance, 1080p WiFi IP Indoor Camera with Night Vision, Motion Detection, Phone App, Pet Cat ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/518Ngm46uuL._AC_UL320_.jpg'
),
Product(
id: '376',
title: 'Google Home Mini Stand Holder, Retro Alarm Clock Stand Mount Base Protective Case Compatible with Google Home Mini and Nes...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81JMBFMntiL._AC_UL320_.jpg'
),
Product(
id: '377',
title: 'Sponsored Ad - Pocketalk Classic Language Translator Device - Portable Two-Way Voice Interpreter - 82 Language Smart Trans...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/515RbJ0EsQS._AC_UL320_.jpg'
),
Product(
id: '378',
title: 'Sponsored Ad - Link Dream Bluetooth Earpiece for Cell Phone Hands Free Wireless Headset Noise Cancelling Mic 24Hrs Talking...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rqivOcLML._AC_UL320_.jpg'
),
Product(
id: '379',
title: 'Sponsored Ad - Daytech Caregiver Pager System Call Button Personal Alert Pager for Home Elderly Attendant Patient Nurses S...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71rUqXE7azL._AC_UL320_.jpg'
),
Product(
id: '380',
title: 'Sponsored Ad - Linksys AX1800 Wi-Fi 6 Router Home Networking, Dual Band Wireless AX Gigabit WiFi Router, Speeds up to 1.8 ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51cX+qc4z-L._AC_UL320_.jpg'
),
Product(
id: '381',
title: 'Sponsored Ad - Arylic WiFi & Bluetooth Home Amplifier,TPA3116 with 50+50W 24V DC/2.0 Stereo Channel,Airplay 1 DLNA,Multiro...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61C7DXo13kL._AC_UL320_.jpg'
),
Product(
id: '382',
title: 'Smart LED Light Bulb E12 Candelabra Bulb WiFi Color Changing LED Bulbs, Dimmable Ceiling Fan Light 40W Equivalent, Smart C...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61yUmTDONPL._AC_UL320_.jpg'
),
Product(
id: '383',
title: 'Mini Smart Plug, WiFi Plugs Works with Alexa and Google Home,2.4G Wi-Fi Outlet Socket Remote Control with Surge Protector ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/41RP0wKQBtL._AC_UL320_.jpg'
),
Product(
id: '384',
title: 'All New Echo 4th Gen with Ring Stick Up Cam Battery White',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/613Mmu12d0S._AC_UL320_.jpg'
),
Product(
id: '385',
title: 'Echo Dot (4th Gen) | Charcoal with Sengled Bluetooth bulb | Alexa smart home starter kit',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81+K8ZKUkDL._AC_UL320_.jpg'
),
Product(
id: '386',
title: 'CallToU Caregiver Pager Wireless Smart Call Button Nurse Calling Alert Vibration for Elderly/Patient/Disable at Home 1 Rec...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/612PqOIxJAL._AC_UL320_.jpg'
),
Product(
id: '387',
title: 'Geeni Prisma Plus Smart Wi-Fi LED Dimmable RBGW Recessed Multicolor Downlight, Works with Alexa and Google Assistant (270...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81mKkiVaKEL._AC_UL320_.jpg'
),
Product(
id: '388',
title: 'MoesGo WiFi Smart Power Dimmer Plug Socket Brightness Adjust Timer Plug Tuya Smart Life App Compatible for Amazon Alexa Go...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/417AsH4YyBS._AC_UL320_.jpg'
),
Product(
id: '389',
title: 'SmartCoolous F20 Smart Lock Fully Automatic Tuya Smart Lock Fingerprint Door Lock 4-in-1 Unlock Touch Screen Bluetooth APP...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/419GIWLo6cS._AC_UL320_.jpg'
),
Product(
id: '390',
title: 'Outdoor Smart Plug, meross Outdoor Wi-Fi Outlet with 3 Independent Sockets Compatible with Apple Homekit, Alexa, Google Ho...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61pcsEQ-RVL._AC_UL320_.jpg'
),
Product(
id: '391',
title: 'Sponsored Ad - ULTRALOQ Smart Lock U-Bolt Pro, 6-in-1 Keyless Entry Door Lock with Bluetooth, Biometric Fingerprint and Ke...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61rzPSDHH0L._AC_UL320_.jpg'
),
Product(
id: '392',
title: 'Sponsored Ad - SV3CHome Deadbolt Smart Lock, Bluetooth Control, Indoor Locks for Existing Single Cylinder Deadbolts, Keyle...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51R2cKWDDeL._AC_UL320_.jpg'
),
Product(
id: '393',
title: 'Sponsored Ad - ROSONG Smart Sunset Lamp Projector-App-Controlled Multiple-Colors',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81DfeuiZn8L._AC_UL320_.jpg'
),
Product(
id: '394',
title: 'Refoss Single Pole Smart Switch, Neutral Wire Required, Compatible with Apple HomeKit, Amazon Alexa and Hey Google, Remote...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61wyTGinuNL._AC_UL320_.jpg'
),
Product(
id: '395',
title: 'Home Automation Lighting, ZWAVE Plus Smart Switch by Ecolink, Lighting Control, White Single Rocker Style Light Switch Des...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61EWYufYNTL._AC_UL320_.jpg'
),
Product(
id: '396',
title: '【2 Way Audio,2K/3MP】 Wireless Security Camera System,SmartSF 4Pcs Security Camera Outdoor 8CH NVR with 1TB Hard Drive,IP66...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61kvdAPWduL._AC_UL320_.jpg'
),
Product(
id: '397',
title: 'Dogain Smart Light Bulb Works with Alexa Google Home Siri Shortcut E12 Base B10/B11 WiFi-Bluetooth Candelabra LED Light Bu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/61FmLB6YsWL._AC_UL320_.jpg'
),
Product(
id: '398',
title: 'Certified Refurbished Echo Show 5 (1st Gen, 2019 release) – Compact smart display with Alexa - Charcoal',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/512sVYLsYHL._AC_UL320_.jpg'
),
Product(
id: '399',
title: 'MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home TuYa App Music Sy...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '400',
title: 'Sponsored Ad - Sunset Lamp Projector,Solset Lamp with App and Remote Control,Sunlight Lamp 16 Colors Changing,Romantic Rai...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71jNoqBRPKL._AC_UL320_.jpg'
),
Product(
id: '401',
title: 'Sponsored Ad - Portable Dimmable LED Smart Light Table Lamp White and Color , Tuya WiFi + BLE ( Wireless Conect ) Night Li...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51nca8lPzAL._AC_UL320_.jpg'
),
Product(
id: '402',
title: 'Sponsored Ad - Eversecu 4CH Smart Wireless Security Camera System 4pcs 1080P 2MP Outdoor Cameras & DVR Kit Support Face Ca...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/51tuDTWRlGL._AC_UL320_.jpg'
),
Product(
id: '403',
title: 'Sponsored Ad - MAKDAK Smart 3D Moon Lamp Galaxy Lamp Night Light,5.9 Inch 16 Million Colors,Work with Alexa Google Home Tu...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/81HakRYJ1RL._AC_UL320_.jpg'
),
Product(
id: '404',
title: 'Sponsored Ad - Sunset Lamp Projection,16 Colors Sunset lamp with APP Remote Control/4 Modes,UFO Shape Sunset Light,Sunset ...',
// pret: 0,
linkImg: 'https://m.media-amazon.com/images/I/71Ta0I2lNDL._AC_UL320_.jpg'
),

];
