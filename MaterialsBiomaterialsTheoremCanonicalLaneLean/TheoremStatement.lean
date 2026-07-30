import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure MaterialAdmittedObject where
  carrier : Type
  structure : Type
  property : Prop
  conclusion : property

structure AdmittedObject where
  object : MaterialAdmittedObject
  propertyClosed : object.property
  conclusionClosed : object.conclusion

def objectClosed (O : AdmittedObject) : Prop :=
  O.propertyClosed ∧ O.conclusionClosed

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
