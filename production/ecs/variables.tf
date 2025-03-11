variable "ensitf_express_service_secret" {
  default = [
    {
      "name" : "DB_USERNAME"
      "valueFrom" : "/production/ensitf/mysql_user"
    },
    {
      "name" : "DB_PASSWORD"
      "valueFrom" : "/production/ensitf/mysql_password"
    },
    {
      "name" : "ALGOLIA_APP_ID"
      "valueFrom" : "/production/ensitf/algolia_app_id"
    },
    {
      "name" : "ALGOLIA_SECRET"
      "valueFrom" : "/production/ensitf/algolia_secret"
    },
    {
      "name" : "MIX_PUSHER_APP_CLUSTER"
      "valueFrom" : "/production/ensitf/mix_pusher_app_cluster"
    },
    {
      "name" : "MIX_PUSHER_APP_KEY"
      "valueFrom" : "/production/ensitf/mix_pusher_app_key"
    },
    {
      "name" : "MAIL_FROM_NAME"
      "valueFrom" : "/production/ensitf/mail_from_name"
    },
    {
      "name" : "APP_KEY"
      "valueFrom" : "/production/ensitf/app_key"
    }
  ]
}

variable "env" {
  default = "production"
}

variable "prod_lb" {

}

variable "ensitf_ng_zone_id" {

}

variable "efs_sg_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "1"
      to_port            = "6500"
      protocol           = "tcp"
      allowed_cidr_block = "0.0.0.0/0"
    }
  }
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

variable "pglnigeriaerp_zone_id" {

}

variable "ensitf_express_service_env" {
  default = [
    {
      "name" : "MAIL_HOST"
      "value" : "smtp.mailtrap.io"
    },
    {
      "name" : "MAIL_MAILER"
      "value" : "smtp"
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
      "value" : "https://express.ensitf.ng"
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
      "value" : "ensitf_db"
    },
    {
      "name" : "DB_PORT"
      "value" : "3306"
    },
    {
      "name" : "DB_HOST"
      "value" : "ensitf-production-db.c1m0sg6uaxcl.eu-west-1.rds.amazonaws.com"
    },
    {
      "name" : "MAIL_PORT"
      "value" : "2525"
    },
    {
      "name" : "MAIL_USERNAME"
      "value" : "null"
    },
    {
      "name" : "MAIL_PASSWORD"
      "value" : "null"
    },
    {
      "name" : "MAIL_ENCRYPTION"
      "value" : "null"
    },
    {
      "name" : "MAIL_FROM_ADDRESS"
      "value" : "null"
    },
    {
      "name" : "CONTAINER_ROLE"
      "value" : "app"
    },
    {
      "name" : "APP_ENV"
      "value" : "production"
    }
  ]
}


variable "ensitf_optima_service_secret" {
  default = [
    {
      "name" : "DB_USERNAME"
      "valueFrom" : "/production/ensitf/mysql_user"
    },
    {
      "name" : "DB_PASSWORD"
      "valueFrom" : "/production/ensitf/mysql_password"
    },
    {
      "name" : "ALGOLIA_APP_ID"
      "valueFrom" : "/production/ensitf/algolia_app_id"
    },
    {
      "name" : "ALGOLIA_SECRET"
      "valueFrom" : "/production/ensitf/algolia_secret"
    },
    {
      "name" : "MIX_PUSHER_APP_CLUSTER"
      "valueFrom" : "/production/ensitf/mix_pusher_app_cluster"
    },
    {
      "name" : "MIX_PUSHER_APP_KEY"
      "valueFrom" : "/production/ensitf/mix_pusher_app_key"
    },
    {
      "name" : "MAIL_FROM_NAME"
      "valueFrom" : "/production/ensitf/mail_from_name"
    },
    {
      "name" : "APP_KEY"
      "valueFrom" : "/production/optima/app_key"
    }
  ]
}


variable "ensitf_optima_service_env" {
  default = [
    {
      "name" : "MAIL_HOST"
      "value" : "smtp.mailtrap.io"
    },
    {
      "name" : "MAIL_MAILER"
      "value" : "smtp"
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
      "value" : "https://optima.ensitf.ng"
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
      "value" : "ensitf_db"
    },
    {
      "name" : "DB_PORT"
      "value" : "3306"
    },
    {
      "name" : "DB_HOST"
      "value" : "ensitf-production-db.c1m0sg6uaxcl.eu-west-1.rds.amazonaws.com"
    },
    {
      "name" : "MAIL_PORT"
      "value" : "2525"
    },
    {
      "name" : "MAIL_USERNAME"
      "value" : "null"
    },
    {
      "name" : "MAIL_PASSWORD"
      "value" : "null"
    },
    {
      "name" : "MAIL_ENCRYPTION"
      "value" : "null"
    },
    {
      "name" : "MAIL_FROM_ADDRESS"
      "value" : "null"
    },
    {
      "name" : "CONTAINER_ROLE"
      "value" : "app"
    },
    {
      "name" : "APP_ENV"
      "value" : "production"
    },
    {
      "name" : "DOCUMENT_URL"
      "value" : "https://express.idlemindstechnologiesltd.com/"
    }
  ]
}


variable "erp_svc_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "443"
      to_port            = "443"
      protocol           = "tcp"
      allowed_cidr_block = "10.116.0.0/16"
    }
  }
}


variable "erp_svc_secrets" {
  default = [
    {
      "name" : "DB_USERNAME"
      "valueFrom" : "/software/prod/erp/mysql_user"
    },
    {
      "name" : "DB_PASSWORD"
      "valueFrom" : "/software/prod/erp/mysql_password"
    },
    {
      "name" : "MAIL_FROM_NAME"
      "valueFrom" : "/software/prod/erp/mail_from_name"
    },
    {
      "name" : "APP_KEY"
      "valueFrom" : "/software/prod/erp/app_key"
    },
    {
      "name" : "MAIL_PASSWORD"
      "valueFrom" : "/software/prod/erp/mail_password"
    },
    {
      "name" : "MAIL_USERNAME"
      "valueFrom" : "/software/prod/erp/mail_username"
    },
    {
      "name" : "MIX_PUSHER_APP_KEY"
      "valueFrom" : "/software/prod/erp/mix_pusher_app_key"
    },
    {
      "name" : "MIX_PUSHER_APP_CLUSTER"
      "valueFrom" : "/software/prod/erp/mix_pusher_app_cluster"
    }
  ]
}



variable "erp_svc_env" {
  default = [
    {
      "name" : "MAIL_HOST"
      "value" : "mailhog"
    },
    {
      "name" : "MAIL_MAILER"
      "value" : "smtp"
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
      "value" : "PGLERP"
    },
    {
      "name" : "APP_DEBUG"
      "value" : "false"
    },
    {
      "name" : "APP_URL"
      "value" : "https://erp.ensitf.ng"
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
      "value" : "erp_production"
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
      "value" : "1025"
    },
    {
      "name" : "MAIL_ENCRYPTION"
      "value" : "null"
    },
    {
      "name" : "MAIL_FROM_ADDRESS"
      "value" : "hello@example.com"
    },
    {
      "name" : "CONTAINER_ROLE"
      "value" : "app"
    },
    {
      "name" : "APP_ENV"
      "value" : "local"
    },
    {
      "name" : "LOG_DEPRECATIONS_CHANNEL"
      "value" : "null"
    },
    {
      "name" : "LOG_LEVEL"
      "value" : "debug"
    },
    {
      "name" : "PUSHER_APP_ID"
      "value" : ""
    },
    {
      "name" : "PUSHER_APP_KEY"
      "value" : ""
    },
    {
      "name" : "PUSHER_APP_SECRET"
      "value" : ""
    },
    {
      "name" : "PUSHER_APP_CLUSTER"
      "value" : "mt1"
    }
  ]
}