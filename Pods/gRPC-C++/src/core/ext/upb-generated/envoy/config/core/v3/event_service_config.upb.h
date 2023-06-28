/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/core/v3/event_service_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_CONFIG_CORE_V3_EVENT_SERVICE_CONFIG_PROTO_UPB_H_
#define ENVOY_CONFIG_CORE_V3_EVENT_SERVICE_CONFIG_PROTO_UPB_H_

#include "upb/msg_internal.h"
#include "upb/decode.h"
#include "upb/decode_fast.h"
#include "upb/encode.h"

#include "upb/port_def.inc"

#ifdef __cplusplus
extern "C" {
#endif

struct envoy_config_core_v3_EventServiceConfig;
typedef struct envoy_config_core_v3_EventServiceConfig envoy_config_core_v3_EventServiceConfig;
extern const upb_MiniTable envoy_config_core_v3_EventServiceConfig_msginit;
struct envoy_config_core_v3_GrpcService;
extern const upb_MiniTable envoy_config_core_v3_GrpcService_msginit;



/* envoy.config.core.v3.EventServiceConfig */

UPB_INLINE envoy_config_core_v3_EventServiceConfig* envoy_config_core_v3_EventServiceConfig_new(upb_Arena* arena) {
  return (envoy_config_core_v3_EventServiceConfig*)_upb_Message_New(&envoy_config_core_v3_EventServiceConfig_msginit, arena);
}
UPB_INLINE envoy_config_core_v3_EventServiceConfig* envoy_config_core_v3_EventServiceConfig_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_core_v3_EventServiceConfig* ret = envoy_config_core_v3_EventServiceConfig_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_core_v3_EventServiceConfig_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_core_v3_EventServiceConfig* envoy_config_core_v3_EventServiceConfig_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_core_v3_EventServiceConfig* ret = envoy_config_core_v3_EventServiceConfig_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_core_v3_EventServiceConfig_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_core_v3_EventServiceConfig_serialize(const envoy_config_core_v3_EventServiceConfig* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_core_v3_EventServiceConfig_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_core_v3_EventServiceConfig_serialize_ex(const envoy_config_core_v3_EventServiceConfig* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_core_v3_EventServiceConfig_msginit, options, arena, &ptr, len);
  return ptr;
}
typedef enum {
  envoy_config_core_v3_EventServiceConfig_config_source_specifier_grpc_service = 1,
  envoy_config_core_v3_EventServiceConfig_config_source_specifier_NOT_SET = 0
} envoy_config_core_v3_EventServiceConfig_config_source_specifier_oneofcases;
UPB_INLINE envoy_config_core_v3_EventServiceConfig_config_source_specifier_oneofcases envoy_config_core_v3_EventServiceConfig_config_source_specifier_case(const envoy_config_core_v3_EventServiceConfig* msg) {
  return (envoy_config_core_v3_EventServiceConfig_config_source_specifier_oneofcases)*UPB_PTR_AT(msg, UPB_SIZE(0, 0), int32_t);
}
UPB_INLINE bool envoy_config_core_v3_EventServiceConfig_has_grpc_service(const envoy_config_core_v3_EventServiceConfig* msg) {
  return _upb_getoneofcase(msg, UPB_SIZE(0, 0)) == 1;
}
UPB_INLINE void envoy_config_core_v3_EventServiceConfig_clear_grpc_service(const envoy_config_core_v3_EventServiceConfig* msg) {
  UPB_WRITE_ONEOF(msg, struct envoy_config_core_v3_GrpcService*, UPB_SIZE(4, 8), 0, UPB_SIZE(0, 0), envoy_config_core_v3_EventServiceConfig_config_source_specifier_NOT_SET);
}
UPB_INLINE const struct envoy_config_core_v3_GrpcService* envoy_config_core_v3_EventServiceConfig_grpc_service(const envoy_config_core_v3_EventServiceConfig* msg) {
  return UPB_READ_ONEOF(msg, const struct envoy_config_core_v3_GrpcService*, UPB_SIZE(4, 8), UPB_SIZE(0, 0), 1, NULL);
}

UPB_INLINE void envoy_config_core_v3_EventServiceConfig_set_grpc_service(envoy_config_core_v3_EventServiceConfig *msg, struct envoy_config_core_v3_GrpcService* value) {
  UPB_WRITE_ONEOF(msg, struct envoy_config_core_v3_GrpcService*, UPB_SIZE(4, 8), value, UPB_SIZE(0, 0), 1);
}
UPB_INLINE struct envoy_config_core_v3_GrpcService* envoy_config_core_v3_EventServiceConfig_mutable_grpc_service(envoy_config_core_v3_EventServiceConfig* msg, upb_Arena* arena) {
  struct envoy_config_core_v3_GrpcService* sub = (struct envoy_config_core_v3_GrpcService*)envoy_config_core_v3_EventServiceConfig_grpc_service(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_GrpcService*)_upb_Message_New(&envoy_config_core_v3_GrpcService_msginit, arena);
    if (!sub) return NULL;
    envoy_config_core_v3_EventServiceConfig_set_grpc_service(msg, sub);
  }
  return sub;
}

extern const upb_MiniTable_File envoy_config_core_v3_event_service_config_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port_undef.inc"

#endif  /* ENVOY_CONFIG_CORE_V3_EVENT_SERVICE_CONFIG_PROTO_UPB_H_ */
