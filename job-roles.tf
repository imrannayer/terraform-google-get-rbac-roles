/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {

  central_iam_role_bindings = {
    "support" = [
      "roles/iam.serviceAccountAdmin",
      "roles/cloudsupport.techSupportViewer",
    ]
    "dba" = [
      "roles/dataflow.admin",
      "roles/dataproc.admin",
      "roles/composer.admin",
      "roles/storage.objectViewer",
      "roles/bigquery.user",
    ]
    "developer" = [
      "roles/dataflow.developer",
      "roles/dataproc.editor",
      "roles/bigquery.user",
      "roles/composer.user",
      "roles/storage.objectViewer",
    ]
    "viewer" = [
      "roles/dataflow.viewer",
      "roles/dataproc.viewer",
      "roles/composer.user",
      "roles/storage.objectViewer",
    ]
  }
}
