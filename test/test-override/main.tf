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

module "get_iam_bindings" {
  source                    = "../../"
  groups_users_roles_needed = var.groups_users_roles_needed

  custom_iam_job_functions = var.custom_iam_job_functions
  override_job_functions   = var.override_job_functions
}

module "project_iam_bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  version  = "~> 7.2"
  projects = [var.project_id]
  mode     = "additive"
  bindings = module.get_iam_bindings.bindings
}
