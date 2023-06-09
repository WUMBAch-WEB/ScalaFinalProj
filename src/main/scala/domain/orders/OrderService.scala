package domain.orders

import cats.Functor
import cats.data.EitherT
import cats.syntax.all._
import domain._

class OrderService[F[_]](orderRepo: OrderRepository[F]) {
  def createOrder(order: Order): F[Order] =
    orderRepo.create(order)

  def get(id: Long)(implicit F: Functor[F]): EitherT[F, OrderNotFoundError.type, Order] =
    EitherT.fromOptionF(orderRepo.get(id), OrderNotFoundError)

  def delete(id: Long)(implicit F: Functor[F]): F[Unit] =
    orderRepo.delete(id).as(())
}

object OrderService {
  def apply[F[_]](orderRepo: OrderRepository[F]): OrderService[F] =
    new OrderService(orderRepo)
}
