# Delivery

    Sistema de Delivery web - Vakinha Burger

# Executar o Backend
    cd dw10_delivery_api
    dart pub global activate json_rest_server

    Se der erro de path:
        Exporte o path. Exemplo linux: export PATH="$PATH":"$HOME/.pub-cache/bin"
        dart pub global activate json_rest_server
    
    json_rest_server run

# Executar o Frontend
    cd delivery
    flutter pub get
    flutter run -d chrome

# Executar o Build Runner
    dart run build_runner watch -d