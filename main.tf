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

  ## Merge custom_iam_job_functions and predefined_iam_job_functions. 
  ## override_job_functions set to true will will override any matching values in predefined_iam_job_functions with custom_iam_job_functions values.

  merged_iam_role_bindings = var.override_job_functions ? merge(local.predefined_iam_job_functions, var.custom_iam_job_functions) : merge(var.custom_iam_job_functions, local.predefined_iam_job_functions)


  ## Create a map of job function for group/user 
  roles_needed_flat = merge([for a, b in var.groups_users_roles_needed :
    { for x in b : "${a}/${x}" => x }
  ]...)

  ## Create a map of job function for group/user 
  project_group_to_role = merge([for a, b in local.roles_needed_flat :
    { for x, y in local.merged_iam_role_bindings : a => y if b == x }
  ]...)


  ## Transpose project_group_to_role in order to get get map of list group/users for roles
  group_to_role_transpose = transpose(local.project_group_to_role == null ? {} : local.project_group_to_role)

  ## Remove role name from group/users

  iam_role_bindings = { for a, b in local.group_to_role_transpose :
    a => toset([for x in b : element(split("/", x), 0)])
  }

}
