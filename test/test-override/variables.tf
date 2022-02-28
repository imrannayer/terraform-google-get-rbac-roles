/**
 * Copyright 2020 Google LLC
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

variable "project_id" {
  type        = string
  description = "The project ID to set IAM bindings (required)"
}

variable "groups_users_roles_needed" {
  type        = map(list(string))
  description = "Map of AD groups and job functions roles"
  default     = {}
}

variable "custom_iam_job_functions" {
  type        = map(list(string))
  description = "List of AD groups assigned restricted IAM admin role"
  default     = null
}

variable "override_job_functions" {
  type        = bool
  description = "Overrides centralized binding with custome bindings"
  default     = false
}
