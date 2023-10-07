.PHONY: run run-dev run-web-dev run-web build build-apk build-model build-l10n build-icon build-launch-page clean test watch help

help:
	@echo "make run 執行stage"
	@echo "make run-dev 執行dev"
	@echo "make run-web-dev 執行dev-web"
	@echo "make run-web 執行stage-web"
	@echo "make build 建置"
	@echo "make build-apk 建置APK"
	@echo "make build-model 編譯元件"
	@echo "make build-l10n 編譯語系"
	@echo "make build-icon 產生APP ICON"
	@echo "make build-launch-page 產生Launch Page"
	@echo "make test 編譯元件"
	@echo "make watch 即時編譯"	
	@echo "make update-build-number 上升一個版本號"	

run:
	@fvm flutter run

run-dev:
	@fvm flutter run lib/main_development.dart

run-web-dev:
	@fvm flutter run lib/main_development.dart -d web-server --web-port=8032

run-web:
	@fvm flutter run -d web-server --web-port=8032

build:
	@fvm flutter build ios --release

build-apk:
	@fvm flutter build apk

build-model:
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

build-l10n:
	@fvm flutter packages get

build-icon:
	@fvm flutter pub run flutter_launcher_icons -f launcher_icons.yaml

build-launch-page:
	@fvm dart run flutter_native_splash:create --path=flutter_native_splash.yaml

clean:
	@sh ./script/clean.sh

test:
	@fvm flutter test

watch:
	@dart pub run build_runner watch

update-build-number:
	@sh ./update_build_number.sh
