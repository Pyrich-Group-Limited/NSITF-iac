variable "env" {
  default = "staging"
}

variable "staging_lb" {

}

variable "ensitf_ng_zone_id" {

}


variable "ensitf_svc_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "443"
      to_port            = "443"
      protocol           = "tcp"
      allowed_cidr_block = "10.116.0.0/16"
    }
  }
}


variable "vpc_id" {

}

variable "private_subnets" {

}


variable "ensitf_ebs_service_env" {
  default = [
    {
      "name" : "MAIL_HOST"
      "value" : "smtp.mailtrap.io"
    },
    {
      "name" : "MAIL_MAILER"
      "value" : "mail.p2enigeria.com"
    },
    {
      "name" : "REDIS_PORT"
      "value" : "6379"
    },
    {
      "name" : "REDIS_PASSWORD"
      "value" : "null"
    },
    {
      "name" : "REDIS_HOST"
      "value" : "127.0.0.1"
    },
    {
      "name" : "SESSION_LIFETIME"
      "value" : "120"
    },
    {
      "name" : "SESSION_DRIVER"
      "value" : "file"
    },
    {
      "name" : "QUEUE_CONNECTION"
      "value" : "sync"
    },
    {
      "name" : "CACHE_DRIVER"
      "value" : "file"
    },
    {
      "name" : "BROADCAST_DRIVER"
      "value" : "log"
    },
    {
      "name" : "APP_NAME"
      "value" : "ensitf"
    },
    {
      "name" : "APP_DEBUG"
      "value" : "False"
    },
    {
      "name" : "APP_URL"
      "value" : "https://ebs.ensitf.ng"
    },
    {
      "name" : "LOG_CHANNEL"
      "value" : "stack"
    },
    {
      "name" : "DB_CONNECTION"
      "value" : "mysql"
    },
    {
      "name" : "DB_DATABASE"
      "value" : "ensitf_staging"
    },
    {
      "name" : "DB_PORT"
      "value" : "3306"
    },
    {
      "name" : "DB_HOST"
      "value" : "ensitf-production-db.ct6ekoycyk4r.eu-west-1.rds.amazonaws.com"
    },
    {
      "name" : "MAIL_PORT"
      "value" : "465"
    },
    {
      "name" : "MAIL_ENCRYPTION"
      "value" : "ssl"
    },
    {
      "name" : "MAIL_FROM_ADDRESS"
      "value" : "info@nsitf.gov.ng"
    },
    {
      "name" : "CONTAINER_ROLE"
      "value" : "app"
    },
    {
      "name" : "APP_ENV"
      "value" : "staging"
    },
    {
      "name" : "REMITA_BASE_URL"
      "value" : "https://remitademo.net/remita/exapp/api/v1/send/api"
    },
    {
      "name" : "REMITA_MERCHANT_ID"
      "value" : "2547916"
    },
    {
      "name" : "REMITA_SERVICE_TYPE_ID"
      "value" : "4430731"
    },
    {
      "name" : "ESSP_URL"
      "value" : "https://essp.enistf.ng"
    }
  ]
}

variable "ensitf_ebs_service_secret" {
  default = [
    {
      "name" : "DB_USERNAME"
      "valueFrom" : "/staging/ebs/mysql_user"
    },
    {
      "name" : "DB_PASSWORD"
      "valueFrom" : "/staging/ebs/mysql_password"
    },
    {
      "name" : "VITE_PUSHER_PORT"
      "valueFrom" : "/staging/ebs/vite_pusher_port"
    },
    {
      "name" : "VITE_PUSHER_HOST"
      "valueFrom" : "/staging/ebs/vite_pusher_host"
    },
    {
      "name" : "VITE_PUSHER_APP_KEY"
      "valueFrom" : "/staging/ebs/vite_pusher_app_key"
    },
    {
      "name" : "VITE_APP_NAME"
      "valueFrom" : "/staging/ebs/vite_app_name"
    },
    {
      "name" : "VITE_PUSHER_SCHEME"
      "valueFrom" : "/staging/ebs/vite_pusher_scheme"
    },
    {
      "name" : "VITE_PUSHER_APP_CLUSTER"
      "valueFrom" : "/staging/ebs/vite_pusher_app_cluster"
    },
    {
      "name" : "MAIL_FROM_NAME"
      "valueFrom" : "/staging/ebs/mail_from_name"
    },
    {
      "name" : "APP_KEY"
      "valueFrom" : "/staging/ebs/app_key"
    },
    {
      "name" : "MAIL_PASSWORD"
      "valueFrom" : "/staging/ebs/mail_password"
    },
    {
      "name" : "MAIL_USERNAME"
      "valueFrom" : "/staging/ebs/mail_username"
    },
    {
      "name" : "REMITA_API_KEY"
      "valueFrom" : "/staging/ebs/remita_api_key"
    },
    {
      "name" : "REMITA_SECRET_KEY"
      "valueFrom" : "/staging/ebs/remita_secret_key"
    },
    {
      "name" : "REMITA_PUBLIC_KEY"
      "valueFrom" : "/staging/ebs/remita_public_key"
    }
  ]
}



variable "ensitf_essp_service_env" {
  default = [
    {
      "name" : "MAIL_HOST"
      "value" : "smtp.mailtrap.io"
    },
    {
      "name" : "MAIL_MAILER"
      "value" : "mail.p2enigeria.com"
    },
    {
      "name" : "REDIS_PORT"
      "value" : "6379"
    },
    {
      "name" : "REDIS_PASSWORD"
      "value" : "null"
    },
    {
      "name" : "REDIS_HOST"
      "value" : "127.0.0.1"
    },
    {
      "name" : "SESSION_LIFETIME"
      "value" : "120"
    },
    {
      "name" : "SESSION_DRIVER"
      "value" : "file"
    },
    {
      "name" : "QUEUE_CONNECTION"
      "value" : "sync"
    },
    {
      "name" : "CACHE_DRIVER"
      "value" : "file"
    },
    {
      "name" : "BROADCAST_DRIVER"
      "value" : "log"
    },
    {
      "name" : "APP_NAME"
      "value" : "ensitf"
    },
    {
      "name" : "APP_DEBUG"
      "value" : "False"
    },
    {
      "name" : "APP_URL"
      "value" : "https://essp.ensitf.ng"
    },
    {
      "name" : "LOG_CHANNEL"
      "value" : "stack"
    },
    {
      "name" : "DB_CONNECTION"
      "value" : "mysql"
    },
    {
      "name" : "DB_DATABASE"
      "value" : "ensitf_staging"
    },
    {
      "name" : "DB_PORT"
      "value" : "3306"
    },
    {
      "name" : "DB_HOST"
      "value" : "ensitf-production-db.ct6ekoycyk4r.eu-west-1.rds.amazonaws.com"
    },
    {
      "name" : "MAIL_PORT"
      "value" : "465"
    },
    {
      "name" : "MAIL_ENCRYPTION"
      "value" : "ssl"
    },
    {
      "name" : "MAIL_FROM_ADDRESS"
      "value" : "info@nsitf.gov.ng"
    },
    {
      "name" : "CONTAINER_ROLE"
      "value" : "app"
    },
    {
      "name" : "APP_ENV"
      "value" : "staging"
    },
    {
      "name" : "REMITA_BASE_URL"
      "value" : "https://remitademo.net/remita/exapp/api/v1/send/api"
    },
    {
      "name" : "REMITA_MERCHANT_ID"
      "value" : "2547916"
    },
    {
      "name" : "REMITA_SERVICE_TYPE_ID"
      "value" : "4430731"
    }
  ]
}


variable "ensitf_essp_service_secret" {
  default = [
    {
      "name" : "DB_USERNAME"
      "valueFrom" : "/staging/ebs/mysql_user"
    },
    {
      "name" : "DB_PASSWORD"
      "valueFrom" : "/staging/ebs/mysql_password"
    },
    {
      "name" : "VITE_PUSHER_PORT"
      "valueFrom" : "/staging/ebs/vite_pusher_port"
    },
    {
      "name" : "VITE_PUSHER_HOST"
      "valueFrom" : "/staging/ebs/vite_pusher_host"
    },
    {
      "name" : "VITE_PUSHER_APP_KEY"
      "valueFrom" : "/staging/ebs/vite_pusher_app_key"
    },
    {
      "name" : "VITE_APP_NAME"
      "valueFrom" : "/staging/ebs/vite_app_name"
    },
    {
      "name" : "VITE_PUSHER_SCHEME"
      "valueFrom" : "/staging/ebs/vite_pusher_scheme"
    },
    {
      "name" : "VITE_PUSHER_APP_CLUSTER"
      "valueFrom" : "/staging/ebs/vite_pusher_app_cluster"
    },
    {
      "name" : "MAIL_FROM_NAME"
      "valueFrom" : "/staging/ebs/mail_from_name"
    },
    {
      "name" : "APP_KEY"
      "valueFrom" : "/staging/essp/app_key"
    },
    {
      "name" : "MAIL_PASSWORD"
      "valueFrom" : "/staging/ebs/mail_password"
    },
    {
      "name" : "MAIL_USERNAME"
      "valueFrom" : "/staging/ebs/mail_username"
    },
    {
      "name" : "REMITA_API_KEY"
      "valueFrom" : "/staging/ebs/remita_api_key"
    },
    {
      "name" : "REMITA_SECRET_KEY"
      "valueFrom" : "/staging/ebs/remita_secret_key"
    },
    {
      "name" : "REMITA_PUBLIC_KEY"
      "valueFrom" : "/staging/ebs/remita_public_key"
    }
  ]
}



variable "ensitf_servicom_svc_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "80"
      to_port            = "80"
      protocol           = "tcp"
      allowed_cidr_block = "10.116.0.0/16"
    }
  }
}




variable "ensitf_servicom_service_env" {
  default = [
    {
      "name" : "DB_HOST"
      "value" : "ensitf-production-db.ct6ekoycyk4r.eu-west-1.rds.amazonaws.com"
    },
    {
      "name" : "DB_DATABASE"
      "value" : "ticket_staging"
    }
  ]
}

variable "ensitf_servicom_service_secret" {
  default = [
    {
      "name" : "DB_PASSWORD"
      "valueFrom" : "/staging/servicom/db_password"
    },
    {
      "name" : "DB_USERNAME"
      "valueFrom" : "/staging/servicom/db_username"
    }
  ]
}