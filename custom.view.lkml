view: sql_runner_query {
  derived_table: {
    sql: select a. id, a. user_id, b.id as it_id, b.order_id
      from demo_db.orders a,
      demo_db. order_items b
      where a.id=b.order_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: it_id {
    type: number
    sql: ${TABLE}.it_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  set: detail {
    fields: [id, user_id, it_id, order_id]
  }
}
