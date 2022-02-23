import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

import "bootstrap"
import "@fortawesome/fontawesome-free/js/all"
import "datatables.net-bs5"
import "./src/globals"
import "./src/datatables_custom"