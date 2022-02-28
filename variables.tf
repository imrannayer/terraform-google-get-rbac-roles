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

variable "groups_users_roles_needed" {
  description = "Map of list of job function roles needed for groups or users"
  type        = map(list(string))
  default     = {}
}

variable "custom_iam_job_functions" {
  type        = map(list(string))
  description = "Map of list of GCP roles for job function. These custom job fnction will merge with predefined job functions in the module"
  default     = null
}

variable "override_job_functions" {
  type        = bool
  description = "Overrides predefined Job function in the module with custom job function for matching values"
  default     = false
}
